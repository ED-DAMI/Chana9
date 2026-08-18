package ma.chana9.modules.annonce.controllers;

import lombok.RequiredArgsConstructor;
import ma.chana9.modules.annonce.dto.AnnonceStatsDTO;
import ma.chana9.modules.annonce.dto.RevenuePointDTO;
import ma.chana9.modules.annonce.dto.SellerGlobalStatsDTO;
import ma.chana9.modules.annonce.dto.SellerRevenueDTO;
import ma.chana9.modules.annonce.services.AnnonceStatsService;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.response.ApiResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(ApiPaths.Annonces.BASE + "/stats")
@RequiredArgsConstructor
public class AnnonceStatsController {

    private final AnnonceStatsService annonceStatsService;

    @GetMapping("/me")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<SellerGlobalStatsDTO> getMyStats(
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceStatsService.getGlobalStats(userId));
    }

    @GetMapping("/seller/{sellerId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ApiResponse<SellerGlobalStatsDTO> getSellerStats(
            @PathVariable UUID sellerId) {
        return ApiResponse.success(null, annonceStatsService.getGlobalStats(sellerId));
    }

    @GetMapping("/me/revenue")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<SellerRevenueDTO> getMyRevenue(
            @AuthenticationPrincipal UUID userId,
            @RequestParam(defaultValue = "month") String period) {
        return ApiResponse.success(null, annonceStatsService.getRevenue(userId, period));
    }

    @GetMapping("/me/revenue/chart")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<List<RevenuePointDTO>> getMyRevenueChart(
            @AuthenticationPrincipal UUID userId,
            @RequestParam(defaultValue = "month") String period) {
        return ApiResponse.success(null, annonceStatsService.getRevenueChart(userId, period));
    }
    
    @GetMapping("/me/annonces")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<List<AnnonceStatsDTO>> getMyAnnonceStats(
            @AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, annonceStatsService.getAnnonceStats(userId));
    }

}