package ma.chana9.modules.annonce;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AnnonceRepository extends JpaRepository<Annonce, UUID> {
}
