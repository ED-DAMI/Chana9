import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_request_model.freezed.dart';
part 'update_profile_request_model.g.dart';

@freezed
abstract class UpdateProfileRequestModel with _$UpdateProfileRequestModel {
  const factory UpdateProfileRequestModel({
    String? fullName,
    String? region,
  }) = _UpdateProfileRequestModel;

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestModelFromJson(json);
}
