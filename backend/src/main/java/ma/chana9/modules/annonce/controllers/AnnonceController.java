package ma.chana9.modules.annonce.controllers;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.annonce.dto.*;
import ma.chana9.modules.annonce.entities.AnnonceAlert;
import ma.chana9.modules.annonce.services.AnnonceService;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.response.ApiResponse;
import ma.chana9.shared.security.AppUserDetails;
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
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<AnnonceResponse> create(
            @Valid @RequestBody AnnonceRequest request,
            @AuthenticationPrincipal UUID userID) {
        return ApiResponse.success("200", annonceService.create(request, userID));
    }

    @PutMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<AnnonceResponse> update(
            @PathVariable UUID id,
            @Valid @RequestBody AnnonceRequest request,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success("200", annonceService.update(id, request, userId));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(
            @PathVariable UUID id,
            @AuthenticationPrincipal AppUserDetails userDetails) {
        annonceService.delete(id, userDetails.getId());
    }

    @GetMapping("/{id}")
    public ApiResponse<AnnonceResponse> findById(@PathVariable UUID id) {
        return ApiResponse.success("200", annonceService.findById(id));
    }

    @GetMapping("/search")
    public ApiResponse<Page<AnnonceResponse>> search(
            @Valid AnnonceSearchRequest request,
            Pageable pageable) {
        return ApiResponse.success("200", annonceService.search(request, pageable));
    }

    @GetMapping("/seller/{sellerId}")
    public ApiResponse<Page<AnnonceResponse>> findBySeller(
            @PathVariable UUID sellerId,
            Pageable pageable) {
        return ApiResponse.success(null, annonceService.findBySeller(sellerId, pageable));
    }

    @PatchMapping("/{id}/suspend")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<AnnonceResponse> suspend(
            @PathVariable UUID id,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceService.suspend(id, userId));
    }

    @PatchMapping("/{id}/reactivate")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<AnnonceResponse> reactivate(
            @PathVariable UUID id,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceService.reactivate(id, userId));
    }

    @PatchMapping("/{id}/sold")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<AnnonceResponse> markAsSold(
            @PathVariable UUID id,
            @AuthenticationPrincipal AppUserDetails userDetails) {
        return ApiResponse.success(null, annonceService.markAsSold(id, userDetails.getId()));
    }

    @PostMapping("/{id}/top-lot/{durationDays}")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<AnnonceResponse> activateTopLot(
            @PathVariable UUID id,
            @PathVariable int durationDays,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceService.activateTopLot(id, userId, durationDays));
    }

    @PostMapping("/{id}/flag")
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    public void flag(
            @PathVariable UUID id,
            @Valid @RequestBody AnnonceFlagRequest request,
            @AuthenticationPrincipal UUID userId) {
        annonceService.flag(id, userId, request);
    }

    @PostMapping("/{id}/favorites")
    @PreAuthorize("hasRole('ACHETEUR')")
    @ResponseStatus(HttpStatus.CREATED)
    public void addFavorite(
            @PathVariable UUID id,
            @AuthenticationPrincipal AppUserDetails userDetails) {
        annonceService.addFavorite(id, userDetails.getId());
    }

    @DeleteMapping("/{id}/favorites")
    @PreAuthorize("hasRole('ACHETEUR')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeFavorite(
            @PathVariable UUID id,
            @AuthenticationPrincipal UUID userId) {
        annonceService.removeFavorite(id, userId);
    }

    @GetMapping("/favorites")
    @PreAuthorize("hasRole('ACHETEUR')")
    public ApiResponse<Page<AnnonceResponse>> findFavorites(
            @AuthenticationPrincipal UUID userId,
            Pageable pageable) {
        return ApiResponse.success("200", annonceService.findFavorites(userId, pageable));
    }

    @PostMapping("/alerts")
    @PreAuthorize("hasRole('ACHETEUR')")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<AnnonceAlert> createAlert(
            @Valid @RequestBody AnnonceAlertRequest request,
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceService.createAlert(userId ,request));
    }

    @DeleteMapping("/alerts/{alertId}")
    @PreAuthorize("hasRole('ACHETEUR')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteAlert(
            @PathVariable UUID alertId,
            @AuthenticationPrincipal UUID userId) {
        annonceService.deleteAlert(alertId, userId);
    }

    @GetMapping("/alerts")
    @PreAuthorize("hasRole('ACHETEUR')")
    public ApiResponse<List<AnnonceAlert>> findAlerts(
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success("200", annonceService.findAlertsByBuyer(userId));
    }
}