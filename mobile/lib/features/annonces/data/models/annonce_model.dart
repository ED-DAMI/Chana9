import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';

import '../../../annonces/domain/entities/annonce.dart';
import 'annonce_media_model.dart';

part 'annonce_model.freezed.dart';
part 'annonce_model.g.dart';

@freezed
abstract class AnnonceModel with _$AnnonceModel {
  const AnnonceModel._();

  const factory AnnonceModel({
    required String id,
    required String title,
    String? description,
    required String breed,
    double? estimatedWeight,
    required double price,
    bool? priceNegotiable,
    required String region,
    required AnnonceStatus status,
    AnimalGender? gender,
    DateTime? birthDate,
    int? ageMonths,
    int? effectiveAgeMonths,
    bool? eligibleForAid,
    String? addressLabel,
    double? latitude,
    double? longitude,
    double? distanceKm,
    bool? deliveryAvailable,
    int? deliveryRadiusKm,
    double? deliveryPrice,
    bool? isTopLot,
    DateTime? topLotExpiresAt,
    DateTime? expiresAt,
    required String sellerId,
    @Default([]) List<AnnonceMediaModel> medias,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AnnonceModel;

  factory AnnonceModel.fromJson(Map<String, dynamic> json) =>
      _$AnnonceModelFromJson(json);

  Annonce toEntity() => Annonce(
    id: id,
    title: title,
    description: description,
    breed: breed,
    estimatedWeight: estimatedWeight,
    price: price,
    priceNegotiable: priceNegotiable ?? false,
    region: region,
    status: status,
    gender: gender,
    birthDate: birthDate,
    ageMonths: ageMonths,
    effectiveAgeMonths: effectiveAgeMonths,
    eligibleForAid: eligibleForAid ?? false,
    addressLabel: addressLabel,
    latitude: latitude,
    longitude: longitude,
    distanceKm: distanceKm,
    deliveryAvailable: deliveryAvailable ?? false,
    deliveryRadiusKm: deliveryRadiusKm,
    deliveryPrice: deliveryPrice,
    isTopLot: isTopLot ?? false,
    topLotExpiresAt: topLotExpiresAt,
    expiresAt: expiresAt,
    sellerId: sellerId,
    medias: medias.map((m) => m.toEntity()).toList(),
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}