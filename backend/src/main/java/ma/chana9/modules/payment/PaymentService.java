package ma.chana9.modules.payment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.repositories.AnnonceRepository;
import ma.chana9.modules.payment.dto.ContactUnlockInitiateResponse;
import ma.chana9.modules.payment.dto.ContactUnlockStatusResponse;
import ma.chana9.modules.sequestre.ContactUnlock;
import ma.chana9.modules.sequestre.ContactUnlockRepository;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.enums.ContactUnlockStatus;
import ma.chana9.shared.exception.ApiException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class PaymentService {

    private static final BigDecimal CONTACT_UNLOCK_AMOUNT = new BigDecimal("20.00");
    private static final String CURRENCY                  = "MAD";
    private static final String MOCK_PAYMENT_BASE_URL     = "https://mock-payment.chana9.ma/pay";

    private final ContactUnlockRepository contactUnlockRepository;
    private final AnnonceRepository       annonceRepository;
    private final UserRepository          userRepository;

    @Transactional
    public ContactUnlockInitiateResponse initiateContactUnlock(UUID annonceId, UUID buyerId) {
        if (contactUnlockRepository.existsByBuyerIdAndAnnonceIdAndStatus(
                buyerId, annonceId, ContactUnlockStatus.COMPLETED)) {
            throw new ApiException(HttpStatus.CONFLICT, ErrorKeys.Payment.ALREADY_UNLOCKED);
        }

        Annonce annonce = annonceRepository.findById(annonceId)
                .orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, ErrorKeys.Annonce.NOT_FOUND));

        if (annonce.getSellerId().equals(buyerId)) {
            throw new ApiException(HttpStatus.FORBIDDEN, ErrorKeys.Payment.OWN_ANNONCE);
        }

        User buyer = userRepository.findById(buyerId)
                .orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, ErrorKeys.Payment.BUYER_NOT_FOUND));

        contactUnlockRepository.findByBuyerIdAndAnnonceId(buyerId, annonceId)
                .filter(u -> u.getStatus() == ContactUnlockStatus.PENDING)
                .ifPresent(u -> contactUnlockRepository.delete(u));

        String transactionId = UUID.randomUUID().toString();

        ContactUnlock unlock = ContactUnlock.builder()
                .buyer(buyer)
                .annonce(annonce)
                .amount(CONTACT_UNLOCK_AMOUNT)
                .status(ContactUnlockStatus.PENDING)
                .transactionId(transactionId)
                .build();

        contactUnlockRepository.save(unlock);

        String paymentUrl = "%s?transactionId=%s&amount=%s&currency=%s&annonceId=%s"
                .formatted(MOCK_PAYMENT_BASE_URL, transactionId, CONTACT_UNLOCK_AMOUNT, CURRENCY, annonceId);

        log.info("contact.unlock.initiated buyerId={} annonceId={} transactionId={}",
                buyerId, annonceId, transactionId);

        return new ContactUnlockInitiateResponse(unlock.getId(), paymentUrl, CONTACT_UNLOCK_AMOUNT, CURRENCY);
    }

    @Transactional
    public void handleSuccess(String transactionId, String signature) {
        validateSignature(transactionId, signature);

        ContactUnlock unlock = contactUnlockRepository.findByTransactionId(transactionId)
                .orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, ErrorKeys.Payment.TRANSACTION_NOT_FOUND));

        if (unlock.getStatus() == ContactUnlockStatus.COMPLETED) {
            log.warn("payment.webhook.duplicate transactionId={}", transactionId);
            return;
        }

        unlock.setStatus(ContactUnlockStatus.COMPLETED);
        unlock.setCompletedAt(LocalDateTime.now());
        contactUnlockRepository.save(unlock);

        log.info("contact.unlock.completed transactionId={} annonceId={} buyerId={}",
                transactionId, unlock.getAnnonce().getId(), unlock.getBuyer().getId());
    }

    @Transactional
    public void handleFailure(String transactionId, String signature) {
        validateSignature(transactionId, signature);

        ContactUnlock unlock = contactUnlockRepository.findByTransactionId(transactionId)
                .orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, ErrorKeys.Payment.TRANSACTION_NOT_FOUND));

        if (unlock.getStatus() == ContactUnlockStatus.COMPLETED) {
            return;
        }

        unlock.setStatus(ContactUnlockStatus.FAILED);
        contactUnlockRepository.save(unlock);

        log.info("contact.unlock.failed transactionId={}", transactionId);
    }

    @Transactional(readOnly = true)
    public ContactUnlockStatusResponse getContactUnlock(UUID annonceId, UUID buyerId) {
        ContactUnlock unlock = contactUnlockRepository
                .findByBuyerIdAndAnnonceId(buyerId, annonceId)
                .orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, ErrorKeys.Payment.NOT_UNLOCKED));

        String phone = null;
        if (unlock.getStatus() == ContactUnlockStatus.COMPLETED) {
            User seller = userRepository.findById(annonceId).get();
            phone = seller.getPhone();
        }

        return new ContactUnlockStatusResponse(
                unlock.getId(),
                unlock.getStatus(),
                phone,
                unlock.getCompletedAt()
        );
    }

    private void validateSignature(String transactionId, String signature) {
        // TODO: remplacer par la vraie vérification HMAC de la passerelle
        if (signature == null || signature.isBlank()) {
            log.warn("payment.webhook.invalid-signature transactionId={}", transactionId);
            throw new ApiException(HttpStatus.UNAUTHORIZED, ErrorKeys.Payment.INVALID_SIGNATURE);
        }
    }
}