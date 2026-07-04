package ma.chana9.modules.sequestre;

import java.time.LocalDateTime;
import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import ma.chana9.shared.enums.StatutSequestre;

@Service
@RequiredArgsConstructor
public class SequestreService {

	private final SequestreRepository sequestreRepository;

	public Sequestre create(Sequestre sequestre) {
		if (sequestre.getCreatedAt() == null) {
			sequestre.setCreatedAt(LocalDateTime.now());
		}
		if (sequestre.getStatut() == null) {
			sequestre.setStatut(StatutSequestre.EN_ATTENTE);
		}
		return sequestreRepository.save(sequestre);
	}

	public List<Sequestre> findAll() {
		return sequestreRepository.findAll();
	}
}
