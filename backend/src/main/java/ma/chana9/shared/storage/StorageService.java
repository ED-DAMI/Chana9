package ma.chana9.shared.storage;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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

    public String saveAnnonceMedia(MultipartFile file, String annonceId) throws IOException {
        validate(file);
        String filename = generateFilename(file);
        Path dir = createDirs(properties.getAnnonceOriginalDir(annonceId));
        Files.copy(file.getInputStream(), dir.resolve(filename), StandardCopyOption.REPLACE_EXISTING);
        return "annonces/" + annonceId + "/original/" + filename;
    }

    public String saveUserAvatar(MultipartFile file, String userId) throws IOException {
        validate(file);
        String filename = generateFilename(file);
        Path dir = createDirs(properties.getUserAvatarDir(userId));
        Files.copy(file.getInputStream(), dir.resolve(filename), StandardCopyOption.REPLACE_EXISTING);
        return "users/" + userId + "/avatar/" + filename;
    }

    public String saveUserKyc(MultipartFile file, String userId, String type) throws IOException {
        validate(file);
        String filename = type + getExtension(file);
        Path dir = createDirs(properties.getUserKycDir(userId));
        Files.copy(file.getInputStream(), dir.resolve(filename), StandardCopyOption.REPLACE_EXISTING);
        return "users/" + userId + "/kyc/" + filename;
    }

    public void delete(String relativePath) throws IOException {
        Path path = Paths.get(properties.getRootDir()).resolve(relativePath);
        Files.deleteIfExists(path);
    }

    public void deleteAnnonceDir(String annonceId) throws IOException {
        Path dir = Paths.get(properties.getAnnoncesDir(annonceId));
        if (Files.exists(dir)) {
            Files.walk(dir)
                    .sorted(java.util.Comparator.reverseOrder())
                    .forEach(p -> {
                        try { Files.delete(p); } catch (IOException ignored) {}
                    });
        }
    }

    private void validate(MultipartFile file) {
        if (file.isEmpty()) {
            throw new IllegalArgumentException("File is empty");
        }
        if (!ALLOWED_TYPES.contains(file.getContentType())) {
            throw new IllegalArgumentException("File type not allowed: " + file.getContentType());
        }
        if (file.getSize() > properties.getMaxFileSizeBytes()) {
            throw new IllegalArgumentException("File size exceeds limit");
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

    private Path createDirs(String dir) throws IOException {
        Path path = Paths.get(dir);
        Files.createDirectories(path);
        return path;
    }
}