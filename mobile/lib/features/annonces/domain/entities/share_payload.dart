import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_payload.freezed.dart';

@freezed
abstract class SharePayload with _$SharePayload {
  const factory SharePayload({
    required String text,
    required String deepLink,
    required String fallbackUrl,
  }) = _SharePayload;
}
