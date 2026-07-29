import 'package:freezed_annotation/freezed_annotation.dart';

part 'annonce_report_request_model.freezed.dart';
part 'annonce_report_request_model.g.dart';

@freezed
abstract class AnnonceReportRequestModel with _$AnnonceReportRequestModel {
  const factory AnnonceReportRequestModel({
    required String reason,
    String? comment,
  }) = _AnnonceReportRequestModel;

  factory AnnonceReportRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnnonceReportRequestModelFromJson(json);
}