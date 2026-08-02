package ma.chana9.modules.annonce.controllers;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.annonce.dto.AnnonceAlertRequest;
import ma.chana9.modules.annonce.dto.AnnonceReportRequest;
import ma.chana9.modules.annonce.dto.AnnonceReportResponse;
import ma.chana9.modules.annonce.dto.AnnonceRequest;
import ma.chana9.modules.annonce.dto.AnnonceResponse;
import ma.chana9.modules.annonce.dto.AnnonceSearchRequest;
import ma.chana9.modules.annonce.entities.AnnonceAlert;
import ma.chana9.modules.annonce.services.AnnonceService;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.response.ApiResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;
@RestController
@RequestMapping(ApiPaths.Annonces.BASE)
@RequiredArgsConstructor
public class AnnonceController {
    private final AnnonceService annonceService;
    @PostMapping
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<AnnonceResponse> create(
            @Valid @RequestBody AnnonceRequest request,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceService.create(request, userId));
    }
    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    public ApiResponse<AnnonceResponse> update(
            @PathVariable UUID id,
            @Valid @RequestBody AnnonceRequest request,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceService.update(id, request, userId));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(
            @PathVariable UUID id,
            @AuthenticationPrincipal UUID userId) {
        annonceService.delete(id, userId);
    }

    @GetMapping("/{id}")
    public ApiResponse<AnnonceResponse> findById(@PathVariable UUID id) {
        return ApiResponse.success(null, annonceService.findById(id));
    }

    @GetMapping("/search")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    public ApiResponse<Page<AnnonceResponse>> search(
            @Valid AnnonceSearchRequest request,
            Pageable pageable) {
        return ApiResponse.success(null, annonceService.search(request, pageable));
    }

    @GetMapping("/seller/{sellerId}")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    public ApiResponse<Page<AnnonceResponse>> findBySeller(
            @PathVariable UUID sellerId,
            Pageable pageable) {
        return ApiResponse.success(null, annonceService.findBySeller(sellerId, pageable));
    }

    @PatchMapping("/{id}/suspend")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    public ApiResponse<AnnonceResponse> suspend(
            @PathVariable UUID id,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceService.suspend(id, userId));
    }

    @PatchMapping("/{id}/reactivate")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    public ApiResponse<AnnonceResponse> reactivate(
            @PathVariable UUID id,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceService.reactivate(id, userId));
    }

    @PatchMapping("/{id}/sold")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<AnnonceResponse> markAsSold(
            @PathVariable UUID id,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceService.markAsSold(id, userId));
    }

    @PostMapping("/{id}/top-lot/{durationDays}")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    public ApiResponse<AnnonceResponse> activateTopLot(
            @PathVariable UUID id,
            @PathVariable int durationDays,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(
                null,
                annonceService.activateTopLot(id, userId, durationDays)
        );
    }

    @PostMapping("/{id}/favorites")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    @ResponseStatus(HttpStatus.CREATED)
    public void addFavorite(
            @PathVariable UUID id,
            @AuthenticationPrincipal UUID userId) {
        annonceService.addFavorite(id, userId);
    }

    @DeleteMapping("/{id}/favorites")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeFavorite(
            @PathVariable UUID id,
            @AuthenticationPrincipal UUID userId) {
        annonceService.removeFavorite(id, userId);
    }

    @GetMapping("/favorites")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    public ApiResponse<Page<AnnonceResponse>> findFavorites(
            @AuthenticationPrincipal UUID userId,
            Pageable pageable) {
        return ApiResponse.success(
                null,
                annonceService.findFavorites(userId, pageable)
        );
    }

    @PostMapping("/{id}/reports")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<AnnonceReportResponse> report(
            @PathVariable UUID id,
            @Valid @RequestBody AnnonceReportRequest request,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(
                null,
                annonceService.report(id, userId, request)
        );
    }

    @PostMapping("/alerts")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<AnnonceAlert> createAlert(
            @Valid @RequestBody AnnonceAlertRequest request,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(
                null,
                annonceService.createAlert(userId, request)
        );
    }
    @DeleteMapping("/alerts/{alertId}")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteAlert(
            @PathVariable UUID alertId,
            @AuthenticationPrincipal UUID userId) {
        annonceService.deleteAlert(alertId, userId);
    }

    @GetMapping("/alerts")
    @PreAuthorize("hasAnyRole('ELEVEUR', 'ADMIN', 'ACHETEUR')")
    public ApiResponse<List<AnnonceAlert>> findAlerts(
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(
                null,
                annonceService.findAlertsByBuyer(userId)
        );
    }
}