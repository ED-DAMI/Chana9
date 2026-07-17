import 'package:freezed_annotation/freezed_annotation.dart';

part 'annonce_alert_request_model.freezed.dart';
part 'annonce_alert_request_model.g.dart';

@freezed
abstract class AnnonceAlertRequestModel with _$AnnonceAlertRequestModel {
  const AnnonceAlertRequestModel._();

  const factory AnnonceAlertRequestModel({
    String? breed,
    String? region,
    int? radiusKm,
    double? maxPrice,
    int? minAgeMonths,
  }) = _AnnonceAlertRequestModel;

  factory AnnonceAlertRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnnonceAlertRequestModelFromJson(json);
}