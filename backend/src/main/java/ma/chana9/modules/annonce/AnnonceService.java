package ma.chana9.modules.annonce;

import java.time.LocalDateTime;
import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import ma.chana9.shared.enums.StatutAnnonce;

@Service
@RequiredArgsConstructor
public class AnnonceService {

	private final AnnonceRepository annonceRepository;

	public Annonce create(Annonce annonce) {
		if (annonce.getCreatedAt() == null) {
			annonce.setCreatedAt(LocalDateTime.now());
		}
		if (annonce.getStatut() == null) {
			annonce.setStatut(StatutAnnonce.ACTIVE);
		}
		return annonceRepository.save(annonce);
	}

	public List<Annonce> findAll() {
		return annonceRepository.findAll();
	}
}
