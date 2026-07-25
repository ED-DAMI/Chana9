package ma.chana9.modules.annonce.services;

import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.entities.AnnonceMedia;
import ma.chana9.modules.annonce.repositories.AnnonceMediaRepository;
import ma.chana9.modules.annonce.repositories.AnnonceRepository;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.exception.ApiException;
import ma.chana9.shared.storage.StorageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class AnnonceMediaService {

    private final AnnonceRepository annonceRepository;
    private final AnnonceMediaRepository annonceMediaRepository;
    private final StorageService storageService;

    private static final int MAX_MEDIAS_PER_ANNONCE = 8;

    @Transactional
    public AnnonceMedia upload(UUID annonceId, UUID sellerId, MultipartFile file) {

        Annonce annonce = annonceRepository.findById(annonceId)
                .orElseThrow(() -> new ApiException(ErrorKeys.Annonce.NOT_FOUND));

        if (!annonce.getSellerId().equals(sellerId)) {
            throw new ApiException(ErrorKeys.Annonce.FORBIDDEN);
        }

        long count = annonceMediaRepository.countByAnnonceId(annonceId);
        if (count >= MAX_MEDIAS_PER_ANNONCE) {
            throw new ApiException(ErrorKeys.Annonce.MAX_MEDIAS_REACHED);
        }

        String url = storageService.saveAnnonceMedia(file, annonceId.toString());
        AnnonceMedia media = AnnonceMedia.builder()
                .annonce(annonce)
                .url(url)
                .originalFilename(file.getOriginalFilename())
                .contentType(file.getContentType())
                .sizeBytes(file.getSize())
                .displayOrder((int)count)
                .build();
        return annonceMediaRepository.save(media);
    }

    @Transactional
    public void delete(UUID mediaId, UUID sellerId) {
        AnnonceMedia media = annonceMediaRepository.findById(mediaId)
                .orElseThrow(() -> new ApiException(ErrorKeys.Annonce.MEDIA_NOT_FOUND));

        if (!media.getAnnonce().getSellerId().equals(sellerId)) {
            throw new ApiException(ErrorKeys.Annonce.FORBIDDEN);
        }

        storageService.delete(media.getUrl());

        annonceMediaRepository.delete(media);
    }

    public List<AnnonceMedia> findByAnnonce(UUID annonceId) {
        return annonceMediaRepository.findByAnnonceIdOrderByDisplayOrderAsc(annonceId);
    }
}