package ma.chana9.shared.storage;

import lombok.RequiredArgsConstructor;
import ma.chana9.shared.constants.ApiPaths;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Storage.BASE)
public class StorageController {

    private final StorageProperties properties;

    @GetMapping("/**")
    public ResponseEntity<Resource> serve(HttpServletRequest request) throws MalformedURLException {
        String path = request.getRequestURI()
                .substring(request.getContextPath().length() + ApiPaths.Storage.BASE.length() + 1);

        Path filePath = Paths.get(properties.getRootDir()).resolve(path).normalize();
        Resource resource = new UrlResource(filePath.toUri());

        if (!resource.exists() || !resource.isReadable()) {
            return ResponseEntity.notFound().build();
        }

        String contentType;
        try {
            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        } catch (IOException e) {
            contentType = "application/octet-stream";
        }

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .body(resource);
    }
}