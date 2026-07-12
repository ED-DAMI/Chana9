package ma.chana9.modules.annonce.controllers;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.annonce.services.AnnonceService;
import ma.chana9.modules.annonce.dto.*;
import ma.chana9.modules.annonce.entities.AnnonceAlert;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/annonces")
@RequiredArgsConstructor
public class AnnonceController {

    private final AnnonceService annonceService;

    @PostMapping
    public ResponseEntity<AnnonceResponse> create(
            @Valid @RequestBody AnnonceRequest request,
            @RequestHeader("X-User-Id") UUID sellerId
    ) {
        return ResponseEntity.status(HttpStatus.CREATED).body(annonceService.create(request, sellerId));
    }

    @PutMapping("/{id}")
    public ResponseEntity<AnnonceResponse> update(
            @PathVariable UUID id,
            @Valid @RequestBody AnnonceRequest request,
            @RequestHeader("X-User-Id") UUID sellerId
    ) {
        return ResponseEntity.ok(annonceService.update(id, request, sellerId));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(
            @PathVariable UUID id,
            @RequestHeader("X-User-Id") UUID sellerId
    ) {
        annonceService.delete(id, sellerId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<AnnonceResponse> findById(@PathVariable UUID id) {
        return ResponseEntity.ok(annonceService.findById(id));
    }

    @GetMapping("/search")
    public ResponseEntity<Page<AnnonceResponse>> search(
            @Valid AnnonceSearchRequest request,
            Pageable pageable
    ) {
        return ResponseEntity.ok(annonceService.search(request, pageable));
    }

    @GetMapping("/seller/{sellerId}")
    public ResponseEntity<Page<AnnonceResponse>> findBySeller(
            @PathVariable UUID sellerId,
            Pageable pageable
    ) {
        return ResponseEntity.ok(annonceService.findBySeller(sellerId, pageable));
    }

    @PatchMapping("/{id}/suspend")
    public ResponseEntity<AnnonceResponse> suspend(
            @PathVariable UUID id,
            @RequestHeader("X-User-Id") UUID sellerId
    ) {
        return ResponseEntity.ok(annonceService.suspend(id, sellerId));
    }

    @PatchMapping("/{id}/reactivate")
    public ResponseEntity<AnnonceResponse> reactivate(
            @PathVariable UUID id,
            @RequestHeader("X-User-Id") UUID sellerId
    ) {
        return ResponseEntity.ok(annonceService.reactivate(id, sellerId));
    }

    @PatchMapping("/{id}/sold")
    public ResponseEntity<AnnonceResponse> markAsSold(
            @PathVariable UUID id,
            @RequestHeader("X-User-Id") UUID sellerId
    ) {
        return ResponseEntity.ok(annonceService.markAsSold(id, sellerId));
    }

    @PostMapping("/{id}/top-lot/{durationDays}")
    public ResponseEntity<AnnonceResponse> activateTopLot(
            @PathVariable UUID id,
            @PathVariable int durationDays,
            @RequestHeader("X-User-Id") UUID sellerId
    ) {
        return ResponseEntity.ok(annonceService.activateTopLot(id, sellerId, durationDays));
    }

    @PostMapping("/{id}/flag")
    public ResponseEntity<Void> flag(
            @PathVariable UUID id,
            @Valid @RequestBody AnnonceFlagRequest request,
            @RequestHeader("X-User-Id") UUID reporterId
    ) {
        annonceService.flag(id, reporterId, request);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @PostMapping("/{id}/favorites")
    public ResponseEntity<Void> addFavorite(
            @PathVariable UUID id,
            @RequestHeader("X-User-Id") UUID buyerId
    ) {
        annonceService.addFavorite(id, buyerId);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @DeleteMapping("/{id}/favorites")
    public ResponseEntity<Void> removeFavorite(
            @PathVariable UUID id,
            @RequestHeader("X-User-Id") UUID buyerId
    ) {
        annonceService.removeFavorite(id, buyerId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/favorites")
    public ResponseEntity<Page<AnnonceResponse>> findFavorites(
            @RequestHeader("X-User-Id") UUID buyerId,
            Pageable pageable
    ) {
        return ResponseEntity.ok(annonceService.findFavorites(buyerId, pageable));
    }

    @PostMapping("/alerts")
    public ResponseEntity<AnnonceAlert> createAlert(
            @Valid @RequestBody AnnonceAlertRequest request,
            @RequestHeader("X-User-Id") UUID buyerId
    ) {
        return ResponseEntity.status(HttpStatus.CREATED).body(annonceService.createAlert(buyerId, request));
    }

    @DeleteMapping("/alerts/{alertId}")
    public ResponseEntity<Void> deleteAlert(
            @PathVariable UUID alertId,
            @RequestHeader("X-User-Id") UUID buyerId
    ) {
        annonceService.deleteAlert(alertId, buyerId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/alerts")
    public ResponseEntity<List<AnnonceAlert>> findAlerts(
            @RequestHeader("X-User-Id") UUID buyerId
    ) {
        return ResponseEntity.ok(annonceService.findAlertsByBuyer(buyerId));
    }
}
