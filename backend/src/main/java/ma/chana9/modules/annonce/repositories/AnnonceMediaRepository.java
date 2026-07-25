package ma.chana9.modules.annonce.repositories;

import ma.chana9.modules.annonce.entities.AnnonceMedia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface AnnonceMediaRepository extends JpaRepository<AnnonceMedia, UUID> {

    List<AnnonceMedia> findByAnnonceIdOrderByDisplayOrderAsc(UUID annonceId);

    long countByAnnonceId(UUID annonceId);

    @Modifying
    @Query("UPDATE AnnonceMedia m SET m.isCover = false WHERE m.annonce.id = :annonceId")
    void clearCoverByAnnonceId(@Param("annonceId") UUID annonceId);
}
