package ma.chana9.modules.annonce.controllers;

import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import ma.chana9.modules.annonce.entities.AnnonceMedia;
import ma.chana9.modules.annonce.services.AnnonceMediaService;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.response.ApiResponse;
import ma.chana9.shared.security.AppUserDetails;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Annonces.BASE)
public class AnnonceMediaController {

    private final AnnonceMediaService annonceMediaService;

    @PostMapping(value = "/{annonceId}/medias", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<AnnonceMedia> upload(
            @PathVariable UUID annonceId,
            @RequestParam("file") MultipartFile file,
            @AuthenticationPrincipal UUID sellerId) {
        AnnonceMedia media = annonceMediaService.upload(annonceId, sellerId, file);
        return ApiResponse.success(null, media);
    }

    @DeleteMapping("/{annonceId}/medias/{mediaId}")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<Void> delete(
            @PathVariable UUID annonceId,
            @PathVariable UUID mediaId,
            @AuthenticationPrincipal UUID userId) {
        annonceMediaService.delete(mediaId,userId);
        return ApiResponse.success(null, null);
    }
}