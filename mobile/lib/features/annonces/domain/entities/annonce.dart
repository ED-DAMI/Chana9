import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import 'package:ma_chana9_app/shared/enums/animal_breed.dart';
import 'package:ma_chana9_app/shared/enums/animal_dentition.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';
import 'package:ma_chana9_app/shared/enums/price_type.dart';
import 'annonce_media.dart';

part 'annonce.freezed.dart';

@freezed
abstract class Annonce with _$Annonce {
  const factory Annonce({
    required String id,
    required String title,
    String? description,
    required AnimalBreed breed,
    AnimalGender? gender,
    int? ageMonths,
    int? effectiveAgeMonths,
    double? weightKg,
    AnimalDentition? dentition,
    String? onssaTagNumber,
    required double price,
    PriceType? priceType,
    required bool priceNegotiable,
    int? headCount,
    required String region,
    String? addressLabel,
    double? latitude,
    double? longitude,
    double? distanceKm,
    required bool deliveryAvailable,
    double? deliveryPrice,
    bool? boardingAvailable,
    double? boardingDailyPrice,
    required AnnonceStatus status,
    required bool isTopLot,
    DateTime? topLotExpiresAt,
    int? viewsCount,
    int? favoritesCount,
    DateTime? expiresAt,
    required String sellerId,
    required List<AnnonceMedia> medias,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Annonce;
}