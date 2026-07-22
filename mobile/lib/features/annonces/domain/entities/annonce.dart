import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import 'package:ma_chana9_app/shared/enums/animal_breed.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';
import 'annonce_media.dart';

part 'annonce.freezed.dart';

@freezed
abstract class Annonce with _$Annonce {
  const factory Annonce({
    required String id,
    required String title,
    String? description,
    required AnimalBreed breed,
    required double price,
    required bool priceNegotiable,
    required String region,
    required AnnonceStatus status,
    AnimalGender? gender,
    int? ageMonths,
    int? effectiveAgeMonths,
    required bool eligibleForAid,
    String? addressLabel,
    double? latitude,
    double? longitude,
    double? distanceKm,
    required bool deliveryAvailable,
    double? deliveryPrice,
    required bool isTopLot,
    DateTime? topLotExpiresAt,
    DateTime? expiresAt,
    required String sellerId,
    required List<AnnonceMedia> medias,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Annonce;
}