import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import 'package:ma_chana9_app/shared/enums/animal_breed.dart';
import 'package:ma_chana9_app/shared/enums/animal_dentition.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';
import 'package:ma_chana9_app/shared/enums/price_type.dart';
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
    @JsonKey(fromJson: AnimalBreed.fromJson) required AnimalBreed breed,
    @JsonKey(fromJson: AnimalGender.fromJson) AnimalGender? gender,
    int? ageMonths,
    int? effectiveAgeMonths,
    double? weightKg,
    @JsonKey(fromJson: AnimalDentition.fromJson) AnimalDentition? dentition,
    String? onssaTagNumber,
    required double price,
    @JsonKey(fromJson: PriceType.fromJson) PriceType? priceType,
    @Default(false) bool priceNegotiable,
    int? headCount,
    required String region,
    String? addressLabel,
    double? latitude,
    double? longitude,
    double? distanceKm,
    @Default(false) bool deliveryAvailable,
    double? deliveryPrice,
    @Default(false) bool boardingAvailable,
    double? boardingDailyPrice,
    required AnnonceStatus status,
    @Default(false) bool isTopLot,
    DateTime? topLotExpiresAt,
    int? viewsCount,
    int? favoritesCount,
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
    gender: gender,
    ageMonths: ageMonths,
    effectiveAgeMonths: effectiveAgeMonths,
    weightKg: weightKg,
    dentition: dentition,
    onssaTagNumber: onssaTagNumber,
    price: price,
    priceType: priceType,
    priceNegotiable: priceNegotiable,
    headCount: headCount,
    region: region,
    addressLabel: addressLabel,
    latitude: latitude,
    longitude: longitude,
    distanceKm: distanceKm,
    deliveryAvailable: deliveryAvailable,
    deliveryPrice: deliveryPrice,
    boardingAvailable: boardingAvailable,
    boardingDailyPrice: boardingDailyPrice,
    status: status,
    isTopLot: isTopLot,
    topLotExpiresAt: topLotExpiresAt,
    viewsCount: viewsCount,
    favoritesCount: favoritesCount,
    expiresAt: expiresAt,
    sellerId: sellerId,
    medias: medias.map((m) => m.toEntity()).toList(),
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}