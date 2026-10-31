package ma.chana9.modules.annonce.services;

import ma.chana9.modules.annonce.dto.AnnonceRequest;
import ma.chana9.modules.annonce.dto.AnnonceResponse;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.repositories.AnnonceAlertRepository;
import ma.chana9.modules.annonce.repositories.AnnonceReportRepository;
import ma.chana9.modules.annonce.repositories.AnnonceRepository;
import ma.chana9.modules.annonce.repositories.FavoriteRepository;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.enums.AnimalBreed;
import ma.chana9.shared.enums.AnnonceStatus;
import ma.chana9.shared.exception.ApiException;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.locationtech.jts.geom.Point;
import org.springframework.http.HttpStatus;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AnnonceServiceTest {

    @Mock
    private AnnonceRepository annonceRepository;

    @Mock
    private FavoriteRepository favoriteRepository;

    @Mock
    private AnnonceAlertRepository annonceAlertRepository;

    @Mock
    private AnnonceReportRepository annonceReportRepository;

    @Mock
    private AnnonceMapper annonceMapper;

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private AnnonceService annonceService;

    @Test
    void devraitCreerUneAnnonceActiveAvecLaPositionEtLeVendeur() {
        // Arrange
        UUID sellerId = UUID.randomUUID();
        User seller = new User();
        seller.setId(sellerId);
        AnnonceRequest request = request(31.63, -8.00);
        AnnonceResponse response = org.mockito.Mockito.mock(AnnonceResponse.class);

        when(userRepository.findById(sellerId)).thenReturn(Optional.of(seller));
        when(annonceRepository.save(any(Annonce.class))).thenAnswer(invocation -> invocation.getArgument(0));
        when(annonceMapper.toResponse(any(Annonce.class))).thenReturn(response);
        when(annonceAlertRepository.countMatchingAlerts(any(Annonce.class))).thenReturn(0L);

        // Act
        AnnonceResponse resultat = annonceService.create(request, sellerId);

        // Assert
        ArgumentCaptor<Annonce> annonceCaptor = ArgumentCaptor.forClass(Annonce.class);
        verify(annonceRepository).save(annonceCaptor.capture());
        Annonce annonceSauvegardee = annonceCaptor.getValue();

        assertThat(resultat).isSameAs(response);
        assertThat(annonceSauvegardee.getTitle()).isEqualTo("Annonce de test");
        assertThat(annonceSauvegardee.getPrice()).isEqualByComparingTo("3000.00");
        assertThat(annonceSauvegardee.getSeller()).isSameAs(seller);
        assertThat(annonceSauvegardee.getStatus()).isEqualTo(AnnonceStatus.ACTIVE);
        Point location = annonceSauvegardee.getLocation();
        assertThat((Object) location).isNotNull();
        assertThat(location.getY()).isEqualTo(31.63);
        assertThat(location.getX()).isEqualTo(-8.00);
    }

    @Test
    void devraitRefuserLaCreationQuandLeVendeurEstIntrouvable() {
        // Arrange
        UUID sellerId = UUID.randomUUID();
        when(userRepository.findById(sellerId)).thenReturn(Optional.empty());

        // Act / Assert
        assertThatThrownBy(() -> annonceService.create(request(null, null), sellerId))
                .isInstanceOf(ApiException.class)
                .satisfies(exception -> {
                    ApiException apiException = (ApiException) exception;
                    assertThat(apiException.getStatus()).isEqualTo(HttpStatus.NOT_FOUND);
                    assertThat(apiException.getMessageKey()).isEqualTo(ErrorKeys.User.NOT_FOUND);
                });

        verify(annonceRepository, never()).save(any(Annonce.class));
    }

    @Test
    void devraitIncrementerLeNombreDeVuesLorsDeLaConsultation() {
        // Arrange
        UUID annonceId = UUID.randomUUID();
        Annonce annonce = Annonce.builder()
                .id(annonceId)
                .viewsCount(4L)
                .build();
        AnnonceResponse response = org.mockito.Mockito.mock(AnnonceResponse.class);
        when(annonceRepository.findById(annonceId)).thenReturn(Optional.of(annonce));
        when(annonceMapper.toResponse(annonce)).thenReturn(response);

        // Act
        AnnonceResponse resultat = annonceService.findById(annonceId);

        // Assert
        assertThat(resultat).isSameAs(response);
        assertThat(annonce.getViewsCount()).isEqualTo(5L);
        verify(annonceMapper).toResponse(annonce);
    }

    @Test
    void devraitSuspendreUneAnnonceDuVendeur() {
        // Arrange
        UUID annonceId = UUID.randomUUID();
        UUID sellerId = UUID.randomUUID();
        Annonce annonce = ownedAnnonce(annonceId, sellerId);
        when(annonceRepository.findById(annonceId)).thenReturn(Optional.of(annonce));
        when(annonceRepository.save(annonce)).thenReturn(annonce);

        // Act
        annonceService.suspend(annonceId, sellerId);

        // Assert
        assertThat(annonce.getStatus()).isEqualTo(AnnonceStatus.SUSPENDED);
        verify(annonceRepository).save(annonce);
    }

    @Test
    void devraitRefuserLaModificationParUnAutreVendeur() {
        // Arrange
        UUID annonceId = UUID.randomUUID();
        UUID ownerId = UUID.randomUUID();
        UUID otherSellerId = UUID.randomUUID();
        when(annonceRepository.findById(annonceId)).thenReturn(Optional.of(ownedAnnonce(annonceId, ownerId)));

        // Act / Assert
        assertThatThrownBy(() -> annonceService.update(annonceId, request(null, null), otherSellerId))
                .isInstanceOf(ApiException.class)
                .satisfies(exception -> {
                    ApiException apiException = (ApiException) exception;
                    assertThat(apiException.getStatus()).isEqualTo(HttpStatus.FORBIDDEN);
                    assertThat(apiException.getMessageKey()).isEqualTo(ErrorKeys.Annonce.FORBIDDEN);
                });

        verify(annonceRepository, never()).save(any(Annonce.class));
    }

    private static Annonce ownedAnnonce(UUID annonceId, UUID sellerId) {
        User seller = new User();
        seller.setId(sellerId);
        return Annonce.builder()
                .id(annonceId)
                .seller(seller)
                .status(AnnonceStatus.ACTIVE)
                .viewsCount(0L)
                .build();
    }

    private static AnnonceRequest request(Double latitude, Double longitude) {
        return new AnnonceRequest(
                "Annonce de test",
                "Description",
                AnimalBreed.SARDI,
                null,
                12,
                null,
                null,
                null,
                new BigDecimal("3000.00"),
                null,
                false,
                1,
                "Marrakech",
                "Centre",
                latitude,
                longitude,
                false,
                null,
                false,
                null
        );
    }
}
