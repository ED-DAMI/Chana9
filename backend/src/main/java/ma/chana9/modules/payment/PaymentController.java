package ma.chana9.modules.payment;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.payment.dto.ContactUnlockInitiateResponse;
import ma.chana9.modules.payment.dto.ContactUnlockStatusResponse;
import ma.chana9.modules.payment.dto.PaymentWebhookRequest;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.response.ApiResponse;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
public class PaymentController {

    private final PaymentService paymentService;

    @PostMapping(ApiPaths.Annonces.BASE + "/{annonceId}/contact/initiate")
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<ContactUnlockInitiateResponse> initiateContactUnlock(
            @PathVariable UUID annonceId,
            @AuthenticationPrincipal UUID buyerId) {
        return ApiResponse.success(null, paymentService.initiateContactUnlock(annonceId, buyerId));
    }

    @GetMapping(ApiPaths.Annonces.BASE + "/{annonceId}/contact")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<ContactUnlockStatusResponse> getContactUnlock(
            @PathVariable UUID annonceId,
            @AuthenticationPrincipal UUID buyerId) {
        return ApiResponse.success(null, paymentService.getContactUnlock(annonceId, buyerId));
    }

    @PostMapping(ApiPaths.Payments.WEBHOOK)
    public ApiResponse<Void> webhook(
            @Valid @RequestBody PaymentWebhookRequest request) {
        if ("SUCCESS".equalsIgnoreCase(request.status())) {
            paymentService.handleSuccess(request.transactionId(), request.signature());
        } else {
            paymentService.handleFailure(request.transactionId(), request.signature());
        }
        return ApiResponse.success(null, null);
    }

    @PostMapping(ApiPaths.Payments.MOCK_SUCCESS)
    public ApiResponse<Void> mockSuccess(@RequestParam String transactionId) {
        paymentService.handleSuccess(transactionId, "mock-signature");
        return ApiResponse.success(null, null);
    }

    @PostMapping(ApiPaths.Payments.MOCK_FAILURE)
    public ApiResponse<Void> mockFailure(@RequestParam String transactionId) {
        paymentService.handleFailure(transactionId, "mock-signature");
        return ApiResponse.success(null, null);
    }
}
