package ma.chana9.shared.storage;

import lombok.RequiredArgsConstructor;
import ma.chana9.shared.exception.ApiException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class StorageService {

    private final StorageProperties properties;

    private static final List<String> ALLOWED_TYPES = List.of(
            "image/jpeg",
            "image/png",
            "image/webp"
    );

    public String saveAnnonceMedia(MultipartFile file, String annonceId) {
        validate(file);
        String filename = generateFilename(file);
        try {
            Path dir = createDirs(properties.getAnnonceOriginalDir(annonceId));
            Files.copy(file.getInputStream(), dir.resolve(filename), StandardCopyOption.REPLACE_EXISTING);
            return "annonces/" + annonceId + "/original/" + filename;
        } catch (IOException e) {
            throw new ApiException("Erreur lors de la sauvegarde du média de l'annonce : " + e.getMessage());
        }
    }

    public String saveUserAvatar(MultipartFile file, String userId) {
        validate(file);
        String filename = generateFilename(file);
        try {
            Path dir = createDirs(properties.getUserAvatarDir(userId));
            Files.copy(file.getInputStream(), dir.resolve(filename), StandardCopyOption.REPLACE_EXISTING);
            return "users/" + userId + "/avatar/" + filename;
        } catch (IOException e) {
            throw new ApiException("Erreur lors de la sauvegarde de l'avatar : " + e.getMessage());
        }
    }

    public String saveUserKyc(MultipartFile file, String userId, String type) {
        validate(file);
        String filename = type + getExtension(file);
        try {
            Path dir = createDirs(properties.getUserKycDir(userId));
            Files.copy(file.getInputStream(), dir.resolve(filename), StandardCopyOption.REPLACE_EXISTING);
            return "users/" + userId + "/kyc/" + filename;
        } catch (IOException e) {
            throw new ApiException("Erreur lors de la sauvegarde du document KYC : " + e.getMessage());
        }
    }

    public void delete(String relativePath) {
        if (relativePath == null || relativePath.isBlank()) {
            return;
        }
        try {
            Path rootPath = Paths.get(properties.getRootDir()).toAbsolutePath().normalize();
            Path targetPath = rootPath.resolve(relativePath).normalize();

            if (!targetPath.startsWith(rootPath)) {
                throw new ApiException("Accès au fichier non autorisé.");
            }

            Files.deleteIfExists(targetPath);
        } catch (IOException e) {
            throw new ApiException("Erreur lors de la suppression du fichier : " + e.getMessage());
        }
    }

    public void deleteAnnonceDir(String annonceId) {
        if (annonceId == null || annonceId.isBlank()) {
            return;
        }
        try {
            Path rootPath = Paths.get(properties.getRootDir()).toAbsolutePath().normalize();
            Path dir = rootPath.resolve("annonces/" + annonceId).normalize();

            if (!dir.startsWith(rootPath)) {
                throw new ApiException("Accès au répertoire non autorisé.");
            }

            if (Files.exists(dir)) {
                try (var walk = Files.walk(dir)) {
                    walk.sorted(Comparator.reverseOrder())
                            .forEach(p -> {
                                try {
                                    Files.delete(p);
                                } catch (IOException ignored) {}
                            });
                }
            }
        } catch (IOException e) {
            throw new ApiException("Erreur lors de la suppression du dossier de l'annonce : " + e.getMessage());
        }
    }

    private void validate(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            throw new ApiException("Le fichier est vide.");
        }
        String contentType = file.getContentType();
        if (contentType == null || !ALLOWED_TYPES.contains(contentType)) {
            throw new ApiException("Type de fichier non autorisé. Formats acceptés : JPEG, PNG, WEBP.");
        }
        if (file.getSize() > properties.getMaxFileSizeBytes()) {
            throw new ApiException("La taille du fichier dépasse la limite autorisée.");
        }
    }

    private String generateFilename(MultipartFile file) {
        return UUID.randomUUID() + getExtension(file);
    }

    private String getExtension(MultipartFile file) {
        String original = file.getOriginalFilename();
        if (original != null && original.contains(".")) {
            return original.substring(original.lastIndexOf("."));
        }
        return ".jpg";
    }

    private Path createDirs(String dir) {
        try {
            Path path = Paths.get(dir);
            Files.createDirectories(path);
            return path;
        } catch (IOException e) {
            throw new ApiException("Impossible de créer le répertoire de stockage : " + e.getMessage());
        }
    }
}