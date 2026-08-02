package ma.chana9.modules.user;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import lombok.RequiredArgsConstructor;
import ma.chana9.modules.annonce.repositories.AnnonceRepository;
import ma.chana9.modules.user.dto.*;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.enums.AnnonceStatus;
import ma.chana9.shared.exception.ApiException;
import ma.chana9.shared.security.domain.RefreshToken;
import ma.chana9.shared.security.repository.RefreshTokenRepository;
import ma.chana9.shared.storage.StorageService;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
@Transactional
public class UserService {

	private final UserRepository       userRepository;
	private final UserMapper           userMapper;
	private final StorageService       storageService;
	private final PasswordEncoder      passwordEncoder;
	private final AnnonceRepository    annonceRepository;
	private final RefreshTokenRepository refreshTokenRepository;

	@Transactional(readOnly = true)
	public UserDTO getProfile(UUID userId) {
		return userMapper.toDto(findUserById(userId));
	}

	public UserDTO updateProfile(UUID userId, UserProfileUpdateDTO dto) {
		User user = findUserById(userId);
		user.setFullName(dto.fullName());
		user.setRegion(dto.region());
		return userMapper.toDto(userRepository.save(user));
	}

	@Transactional(readOnly = true)
	public PublicUserDTO getPublicProfile(UUID targetUserId) {
		User user = findUserById(targetUserId);
		return new PublicUserDTO(
				user.getId(),
				user.getFullName(),
				user.getRole(),
				user.isKycVerified(),
				user.getProfilePhotoUrl(),
				user.getRegion()
		);
	}

	public void submitKyc(UUID userId, String cin, MultipartFile cinPhoto, MultipartFile selfie) {
		User user = findUserById(userId);

		if (user.isKycVerified()) {
			throw new ApiException(HttpStatus.CONFLICT, ErrorKeys.User.KYC_ALREADY_VERIFIED);
		}

		String cinPhotoUrl = storageService.saveUserKyc(cinPhoto, userId.toString(), "cin");
		String selfieUrl   = storageService.saveUserKyc(selfie, userId.toString(), "selfie");

		user.setKycCin(cin);
		user.setKycCinPhotoUrl(cinPhotoUrl);
		user.setKycSelfieUrl(selfieUrl);
		user.setKycSubmittedAt(LocalDateTime.now());
		user.setKycVerified(false);

		userRepository.save(user);
	}

	@Transactional(readOnly = true)
	public String getKycStatus(UUID userId) {
		User user = findUserById(userId);
		if (user.isKycVerified()) return "APPROVED";
		if (user.getKycSubmittedAt() != null) return "PENDING";
		return "NOT_SUBMITTED";
	}

	public void approveKyc(UUID targetUserId) {
		User user = findUserById(targetUserId);
		if (user.getKycSubmittedAt() == null) {
			throw new ApiException(HttpStatus.BAD_REQUEST, ErrorKeys.User.KYC_NOT_SUBMITTED);
		}
		user.setKycVerified(true);
		userRepository.save(user);
	}

	public void rejectKyc(UUID targetUserId) {
		User user = findUserById(targetUserId);

		if (user.getKycCinPhotoUrl() != null) {
			storageService.delete(user.getKycCinPhotoUrl());
		}
		if (user.getKycSelfieUrl() != null) {
			storageService.delete(user.getKycSelfieUrl());
		}

		user.setKycVerified(false);
		user.setKycCin(null);
		user.setKycCinPhotoUrl(null);
		user.setKycSelfieUrl(null);
		user.setKycSubmittedAt(null);
		userRepository.save(user);
	}

	public String uploadAvatar(UUID userId, MultipartFile file) {
		User user = findUserById(userId);

		if (user.getProfilePhotoUrl() != null) {
			storageService.delete(user.getProfilePhotoUrl());
		}

		String avatarUrl = storageService.saveUserAvatar(file, userId.toString());
		user.setProfilePhotoUrl(avatarUrl);
		userRepository.save(user);
		return avatarUrl;
	}

	public void deleteAvatar(UUID userId) {
		User user = findUserById(userId);
		if (user.getProfilePhotoUrl() != null) {
			storageService.delete(user.getProfilePhotoUrl());
			user.setProfilePhotoUrl(null);
			userRepository.save(user);
		}
	}

	@Transactional(readOnly = true)
	public Page<UserDTO> findAllUsers(Pageable pageable) {
		return userRepository.findAll(pageable).map(userMapper::toDto);
	}

	public void activateUser(UUID targetUserId) {
		User user = findUserById(targetUserId);
		user.setActive(true);
		userRepository.save(user);
	}

	public void deactivateUser(UUID targetUserId) {
		User user = findUserById(targetUserId);
		user.setActive(false);
		userRepository.save(user);
	}

	public void changeUserRole(UUID targetUserId, RoleUpdateDTO dto) {
		User user = findUserById(targetUserId);
		user.setRole(dto.role());
		userRepository.save(user);
	}

	@Transactional(readOnly = true)
	public UserStatsDTO getUserStats(UUID targetUserId) {
		User user = findUserById(targetUserId);
		long totalAnnonces  = annonceRepository.countBySellerId(user.getId());
		long activeAnnonces = annonceRepository.countBySellerIdAndStatus(user.getId(), AnnonceStatus.ACTIVE);
		long totalSales     = annonceRepository.countBySellerIdAndStatus(user.getId(), AnnonceStatus.SOLD);
		return new UserStatsDTO(totalAnnonces, activeAnnonces, totalSales, 0.0, 0L);
	}

	public void changePassword(UUID userId, PasswordUpdateDTO dto) {
		User user = findUserById(userId);
		if (!passwordEncoder.matches(dto.oldPassword(), user.getPasswordHash())) {
			throw new ApiException(HttpStatus.BAD_REQUEST, ErrorKeys.User.WRONG_PASSWORD);
		}
		user.setPasswordHash(passwordEncoder.encode(dto.newPassword()));
		userRepository.save(user);
	}

	@Transactional(readOnly = true)
	public List<SessionDTO> getActiveSessions(UUID userId) {
		return refreshTokenRepository.findByUserIdAndIsRevokedFalse(userId)
				.stream()
				.map(this::toSessionDTO)
				.toList();
	}

	public void revokeAllSessions(UUID userId) {
		refreshTokenRepository.revokeAllByUserId(userId);
	}

	private SessionDTO toSessionDTO(RefreshToken token) {
		return new SessionDTO(
				token.getId(),
				token.getDeviceFingerprint(),
				token.getUserAgent(),
				token.getIpAddress(),
				token.getCreatedAt(),
				token.getLastUsedAt()
		);
	}

	private User findUserById(UUID id) {
		return userRepository.findById(id)
				.orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, ErrorKeys.User.NOT_FOUND));
	}
}