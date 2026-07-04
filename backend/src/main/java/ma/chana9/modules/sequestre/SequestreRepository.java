package ma.chana9.modules.sequestre;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SequestreRepository extends JpaRepository<Sequestre, UUID> {
}
