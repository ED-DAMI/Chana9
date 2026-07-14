import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';
import '../../domain/entities/annonce.dart';
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
    required bool priceNegotiable,
    required String region,
    required AnnonceStatus status,
    AnimalGender? gender,
    DateTime? birthDate,
    int? ageMonths,
    int? effectiveAgeMonths,
    required bool eligibleForAid,
    String? addressLabel,
    double? latitude,
    double? longitude,
    double? distanceKm,
    required bool deliveryAvailable,
    int? deliveryRadiusKm,
    double? deliveryPrice,
    required bool isTopLot,
    DateTime? topLotExpiresAt,
    DateTime? expiresAt,
    required String sellerId,
    @Default([]) List<AnnonceMediaModel> medias,
    required DateTime createdAt,
    required DateTime updatedAt,
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
        priceNegotiable: priceNegotiable,
        region: region,
        status: status,
        gender: gender,
        birthDate: birthDate,
        ageMonths: ageMonths,
        effectiveAgeMonths: effectiveAgeMonths,
        eligibleForAid: eligibleForAid,
        addressLabel: addressLabel,
        latitude: latitude,
        longitude: longitude,
        distanceKm: distanceKm,
        deliveryAvailable: deliveryAvailable,
        deliveryRadiusKm: deliveryRadiusKm,
        deliveryPrice: deliveryPrice,
        isTopLot: isTopLot,
        topLotExpiresAt: topLotExpiresAt,
        expiresAt: expiresAt,
        sellerId: sellerId,
        medias: medias.map((m) => m.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
