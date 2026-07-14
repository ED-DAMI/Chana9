import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/animal_gender.dart';

part 'annonce_search_request_model.freezed.dart';
part 'annonce_search_request_model.g.dart';

@freezed
abstract class AnnonceSearchRequestModel with _$AnnonceSearchRequestModel {
  const AnnonceSearchRequestModel._();

  const factory AnnonceSearchRequestModel({
    String? breed,
    String? region,
    double? minPrice,
    double? maxPrice,
    double? minWeight,
    double? maxWeight,
    AnimalGender? gender,
    int? minAgeMonths,
    int? maxAgeMonths,
    bool? deliveryAvailable,
    bool? priceNegotiable,
    bool? eligibleForAid,
    bool? topLotOnly,
    double? latitude,
    double? longitude,
    int? radiusKm,
  }) = _AnnonceSearchRequestModel;

  factory AnnonceSearchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnnonceSearchRequestModelFromJson(json);

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{};
    if (breed != null) params['breed'] = breed;
    if (region != null) params['region'] = region;
    if (minPrice != null) params['minPrice'] = minPrice;
    if (maxPrice != null) params['maxPrice'] = maxPrice;
    if (minWeight != null) params['minWeight'] = minWeight;
    if (maxWeight != null) params['maxWeight'] = maxWeight;
    if (gender != null) params['gender'] = gender!.name;
    if (minAgeMonths != null) params['minAgeMonths'] = minAgeMonths;
    if (maxAgeMonths != null) params['maxAgeMonths'] = maxAgeMonths;
    if (deliveryAvailable != null) params['deliveryAvailable'] = deliveryAvailable;
    if (priceNegotiable != null) params['priceNegotiable'] = priceNegotiable;
    if (eligibleForAid != null) params['eligibleForAid'] = eligibleForAid;
    if (topLotOnly != null) params['topLotOnly'] = topLotOnly;
    if (latitude != null) params['latitude'] = latitude;
    if (longitude != null) params['longitude'] = longitude;
    if (radiusKm != null) params['radiusKm'] = radiusKm;
    return params;
  }
}
