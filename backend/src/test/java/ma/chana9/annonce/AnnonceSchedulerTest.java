package ma.chana9.modules.annonce.services;

import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.repositories.AnnonceRepository;
import ma.chana9.shared.enums.AnnonceStatus;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class AnnonceSchedulerTest {

    @Mock
    private AnnonceRepository annonceRepository;

    @InjectMocks
    private AnnonceScheduler annonceScheduler;

    @Captor
    private ArgumentCaptor<List<UUID>> uuidListCaptor;

    @Captor
    private ArgumentCaptor<List<Annonce>> annonceListCaptor;

    private UUID id1;
    private UUID id2;

    @BeforeEach
    void setUp() {
        id1 = UUID.randomUUID();
        id2 = UUID.randomUUID();
    }

    @Nested
    @DisplayName("Tests pour expireAnnonces()")
    class ExpireAnnoncesTests {

        @Test
        @DisplayName("Ne fait rien et ne met à jour aucune annonce si aucune n'est expirée")
        void expireAnnonces_quandAucuneAnnonceExpiree_neFaitRien() {
            // ARRANGE
            when(annonceRepository.findExpired(eq(AnnonceStatus.ACTIVE), any(LocalDateTime.class)))
                    .thenReturn(Collections.emptyList());

            // ACT
            annonceScheduler.expireAnnonces();

            // ASSERT
            verify(annonceRepository, times(1)).findExpired(eq(AnnonceStatus.ACTIVE), any(LocalDateTime.class));
            verify(annonceRepository, never()).updateStatusByIds(any(), any());
        }

        @Test
        @DisplayName("Passe les annonces à l'état EXPIRED lorsque des annonces expirées sont trouvées")
        void expireAnnonces_quandAnnoncesExpirees_metAJourLeStatut() {
            // ARRANGE
            Annonce a1 = new Annonce();
            a1.setId(id1);

            Annonce a2 = new Annonce();
            a2.setId(id2);

            when(annonceRepository.findExpired(eq(AnnonceStatus.ACTIVE), any(LocalDateTime.class)))
                    .thenReturn(List.of(a1, a2));

            // ACT
            annonceScheduler.expireAnnonces();

            // ASSERT
            verify(annonceRepository, times(1)).findExpired(eq(AnnonceStatus.ACTIVE), any(LocalDateTime.class));
            verify(annonceRepository, times(1)).updateStatusByIds(uuidListCaptor.capture(), eq(AnnonceStatus.EXPIRED));

            List<UUID> capturedIds = uuidListCaptor.getValue();
            assertThat(capturedIds).containsExactlyInAnyOrder(id1, id2);
        }
    }

    @Nested
    @DisplayName("Tests pour expireTopLots()")
    class ExpireTopLotsTests {

        @Test
        @DisplayName("Ne fait rien et ne sauvegarde rien si aucun top lot n'est expiré")
        void expireTopLots_quandAucunTopLotExpire_neFaitRien() {
            // ARRANGE
            when(annonceRepository.findExpiredTopLots(any(LocalDateTime.class)))
                    .thenReturn(Collections.emptyList());

            // ACT
            annonceScheduler.expireTopLots();

            // ASSERT
            verify(annonceRepository, times(1)).findExpiredTopLots(any(LocalDateTime.class));
            verify(annonceRepository, never()).saveAll(any());
        }

        @Test
        @DisplayName("Réinitialise topLotExpiresAt à null et sauvegarde les modifications")
        void expireTopLots_quandTopLotsExpires_remetANullEtSauvegarde() {
            // ARRANGE
            Annonce a1 = new Annonce();
            a1.setId(id1);
            a1.setTopLotExpiresAt(LocalDateTime.now().minusHours(1));

            Annonce a2 = new Annonce();
            a2.setId(id2);
            a2.setTopLotExpiresAt(LocalDateTime.now().minusDays(1));

            when(annonceRepository.findExpiredTopLots(any(LocalDateTime.class)))
                    .thenReturn(List.of(a1, a2));

            // ACT
            annonceScheduler.expireTopLots();

            // ASSERT
            verify(annonceRepository, times(1)).findExpiredTopLots(any(LocalDateTime.class));
            verify(annonceRepository, times(1)).saveAll(annonceListCaptor.capture());

            List<Annonce> savedAnnonces = annonceListCaptor.getValue();
            assertThat(savedAnnonces).hasSize(2);
            assertThat(savedAnnonces).extracting(Annonce::getTopLotExpiresAt).containsOnlyNulls();
        }
    }
}