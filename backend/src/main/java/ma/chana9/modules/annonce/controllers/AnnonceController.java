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
            @AuthenticationPrincipal AppUserDetails userDetails) {
        return ApiResponse.success(null, annonceService.create(request, userDetails.getId()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<AnnonceResponse> update(
            @PathVariable UUID id,
            @Valid @RequestBody AnnonceRequest request,
            @AuthenticationPrincipal AppUserDetails userDetails) {
        return ApiResponse.success(null, annonceService.update(id, request, userDetails.getId()));
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
        return ApiResponse.success(null, annonceService.findById(id));
    }
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/search")
    public ApiResponse<Page<AnnonceResponse>> search(
            @Valid AnnonceSearchRequest request,
            Pageable pageable) {
        return ApiResponse.success(null, annonceService.search(request, pageable));
    }
    @PreAuthorize("isAuthenticated()")
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
            @AuthenticationPrincipal AppUserDetails userDetails) {
        return ApiResponse.success(null, annonceService.suspend(id, userDetails.getId()));
    }

    @PatchMapping("/{id}/reactivate")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<AnnonceResponse> reactivate(
            @PathVariable UUID id,
            @AuthenticationPrincipal AppUserDetails userDetails) {
        return ApiResponse.success(null, annonceService.reactivate(id, userDetails.getId()));
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
            @AuthenticationPrincipal AppUserDetails userDetails) {
        return ApiResponse.success(null, annonceService.activateTopLot(id, userDetails.getId(), durationDays));
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
            @AuthenticationPrincipal AppUserDetails userDetails) {
        annonceService.removeFavorite(id, userDetails.getId());
    }

    @GetMapping("/favorites")
    @PreAuthorize("hasRole('ACHETEUR')")
    public ApiResponse<Page<AnnonceResponse>> findFavorites(
            @AuthenticationPrincipal AppUserDetails userDetails,
            Pageable pageable) {
        return ApiResponse.success(null, annonceService.findFavorites(userDetails.getId(), pageable));
    }

    @PostMapping("/{id}/reports")
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<AnnonceReportResponse> report(
            @PathVariable UUID id,
            @Valid @RequestBody AnnonceReportRequest request,
            @AuthenticationPrincipal AppUserDetails userDetails) {
        return ApiResponse.success(null, annonceService.report(id, userDetails.getId(), request));
    }

    @PostMapping("/alerts")
    @PreAuthorize("hasRole('ACHETEUR')")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<AnnonceAlert> createAlert(
            @Valid @RequestBody AnnonceAlertRequest request,
            @AuthenticationPrincipal AppUserDetails userDetails) {
        return ApiResponse.success(null, annonceService.createAlert(userDetails.getId(), request));
    }

    @DeleteMapping("/alerts/{alertId}")
    @PreAuthorize("hasRole('ACHETEUR')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteAlert(
            @PathVariable UUID alertId,
            @AuthenticationPrincipal AppUserDetails userDetails) {
        annonceService.deleteAlert(alertId, userDetails.getId());
    }

    @GetMapping("/alerts")
    @PreAuthorize("hasRole('ACHETEUR')")
    public ApiResponse<List<AnnonceAlert>> findAlerts(
            @AuthenticationPrincipal AppUserDetails userDetails) {
        return ApiResponse.success(null, annonceService.findAlertsByBuyer(userDetails.getId()));
    }
}