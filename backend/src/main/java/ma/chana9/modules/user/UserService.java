package ma.chana9.modules.user;

import java.time.LocalDateTime;
import java.util.UUID;

import lombok.RequiredArgsConstructor;
import ma.chana9.modules.annonce.repositories.AnnonceRepository;
import ma.chana9.modules.user.dto.PasswordUpdateDTO;
import ma.chana9.modules.user.dto.RoleUpdateDTO;
import ma.chana9.modules.user.dto.UserDTO;
import ma.chana9.modules.user.dto.UserProfileUpdateDTO;
import ma.chana9.modules.user.dto.UserStatsDTO;
import ma.chana9.shared.exception.ApiException;
import ma.chana9.shared.security.repository.RefreshTokenRepository;
import ma.chana9.shared.storage.StorageService;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
@Transactional
public class UserService {

	private final UserRepository userRepository;
	private final UserMapper userMapper;
	private final StorageService storageService;
	private final PasswordEncoder passwordEncoder;
	private final AnnonceRepository annonceRepository;
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
	public UserDTO getPublicProfile(UUID targetUserId) {
		return userMapper.toDto(findUserById(targetUserId));
	}

	public void submitKyc(UUID userId, String cin, MultipartFile cinPhoto, MultipartFile selfie) {
		User user = findUserById(userId);

		String cinPhotoUrl = storageService.saveUserKyc(cinPhoto, userId.toString(), "cin");
		String selfieUrl = storageService.saveUserKyc(selfie, userId.toString(), "selfie");

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
		if (user.isKycVerified()) {
			return "APPROVED";
		}
		if (user.getKycSubmittedAt() != null) {
			return "PENDING";
		}
		return "NOT_SUBMITTED";
	}

	public void approveKyc(UUID targetUserId) {
		User user = findUserById(targetUserId);
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

		long totalAnnonces = annonceRepository.countBySeller_Id(user.getId());

		return new UserStatsDTO(
				totalAnnonces,
				0L,
				0L,
				0.0,
				0L
		);
	}

	public void changePassword(UUID userId, PasswordUpdateDTO dto) {
		User user = findUserById(userId);

		if (!passwordEncoder.matches(dto.oldPassword(), user.getPasswordHash())) {
			throw new ApiException("Ancien mot de passe incorrect");
		}

		user.setPasswordHash(passwordEncoder.encode(dto.newPassword()));
		userRepository.save(user);
	}

	@Transactional(readOnly = true)
	public Object getActiveSessions(UUID userId) {
		return refreshTokenRepository.findByUserId(userId);
	}

	public void revokeAllSessions(UUID userId) {
		refreshTokenRepository.deleteByUserId(userId);
	}

	private User findUserById(UUID id) {
		return userRepository.findById(id)
				.orElseThrow(() -> new ApiException("Utilisateur introuvable avec l'ID : " + id));
	}
}