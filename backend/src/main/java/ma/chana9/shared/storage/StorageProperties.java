package ma.chana9.shared.storage;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
@ConfigurationProperties(prefix = "storage")
public class StorageProperties {

    private String rootDir = "uploads";
    private long maxFileSizeBytes = 5 * 1024 * 1024L;
    private int thumbnailWidth = 400;
    private int thumbnailHeight = 400;

    public String getAnnoncesDir(String annonceId) {
        return rootDir + "/annonces/" + annonceId;
    }

    public String getAnnonceOriginalDir(String annonceId) {
        return getAnnoncesDir(annonceId) + "/original";
    }

    public String getAnnonceThumbnailDir(String annonceId) {
        return getAnnoncesDir(annonceId) + "/thumbnail";
    }

    public String getUserDir(String userId) {
        return rootDir + "/users/" + userId;
    }

    public String getUserAvatarDir(String userId) {
        return getUserDir(userId) + "/avatar";
    }

    public String getUserKycDir(String userId) {
        return getUserDir(userId) + "/kyc";
    }

    public String getTempDir() {
        return rootDir + "/temp";
    }
}