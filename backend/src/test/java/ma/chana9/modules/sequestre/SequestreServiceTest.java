package ma.chana9.modules.sequestre;

import ma.chana9.shared.enums.StatutSequestre;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class SequestreServiceTest {

    @Mock
    private SequestreRepository sequestreRepository;

    @InjectMocks
    private SequestreService sequestreService;

    @Test
    void devraitInitialiserLaDateEtLeStatutParDefautAvantSauvegarde() {
        // Arrange
        Sequestre sequestre = new Sequestre();
        sequestre.setMontant(new BigDecimal("3090.00"));
        when(sequestreRepository.save(sequestre)).thenReturn(sequestre);

        // Act
        Sequestre resultat = sequestreService.create(sequestre);

        // Assert
        ArgumentCaptor<Sequestre> sequestreCaptor = ArgumentCaptor.forClass(Sequestre.class);
        verify(sequestreRepository).save(sequestreCaptor.capture());

        Sequestre sequestreSauvegarde = sequestreCaptor.getValue();
        assertThat(sequestreSauvegarde.getCreatedAt()).isNotNull();
        assertThat(sequestreSauvegarde.getStatut()).isEqualTo(StatutSequestre.EN_ATTENTE);
        assertThat(sequestreSauvegarde.getMontant()).isEqualByComparingTo("3090.00");
        assertThat(resultat).isSameAs(sequestre);
    }

    @Test
    void devraitConserverLaDateEtLeStatutFournis() {
        // Arrange
        LocalDateTime dateCreation = LocalDateTime.of(2026, 10, 4, 10, 0);
        Sequestre sequestre = new Sequestre();
        sequestre.setCreatedAt(dateCreation);
        sequestre.setStatut(StatutSequestre.BLOQUE);
        when(sequestreRepository.save(sequestre)).thenReturn(sequestre);

        // Act
        Sequestre resultat = sequestreService.create(sequestre);

        // Assert
        ArgumentCaptor<Sequestre> sequestreCaptor = ArgumentCaptor.forClass(Sequestre.class);
        verify(sequestreRepository).save(sequestreCaptor.capture());

        Sequestre sequestreSauvegarde = sequestreCaptor.getValue();
        assertThat(sequestreSauvegarde.getCreatedAt()).isEqualTo(dateCreation);
        assertThat(sequestreSauvegarde.getStatut()).isEqualTo(StatutSequestre.BLOQUE);
        assertThat(resultat).isSameAs(sequestre);
    }

    @Test
    void devraitRetournerTousLesSequestresDuRepository() {
        // Arrange
        Sequestre premierSequestre = new Sequestre();
        Sequestre secondSequestre = new Sequestre();
        List<Sequestre> sequestres = List.of(premierSequestre, secondSequestre);
        when(sequestreRepository.findAll()).thenReturn(sequestres);

        // Act
        List<Sequestre> resultat = sequestreService.findAll();

        // Assert
        verify(sequestreRepository).findAll();
        assertThat(resultat).containsExactly(premierSequestre, secondSequestre);
        assertThat(resultat).isSameAs(sequestres);
    }
}
