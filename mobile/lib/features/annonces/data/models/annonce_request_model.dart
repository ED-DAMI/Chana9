import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';

part 'annonce_request_model.freezed.dart';
part 'annonce_request_model.g.dart';

@freezed
abstract class AnnonceRequestModel with _$AnnonceRequestModel {
  const AnnonceRequestModel._();

  const factory AnnonceRequestModel({
    required String title,
    String? description,
    required String breed,
    double? estimatedWeight,
    required double price,
    bool? priceNegotiable,
    required String region,
    AnimalGender? gender,
    String? birthDate,
    int? ageMonths,
    double? latitude,
    double? longitude,
    String? addressLabel,
    bool? deliveryAvailable,
    int? deliveryRadiusKm,
    double? deliveryPrice,
  }) = _AnnonceRequestModel;

  factory AnnonceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnnonceRequestModelFromJson(json);
}