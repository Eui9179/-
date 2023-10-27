import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_fcm_request.freezed.dart';
part 'dto_fcm_request.g.dart';

@freezed
class FcmRequest with _$FcmRequest {
  factory FcmRequest({
    required final String fcmToken,
  }) = _FcmRequest;

  factory FcmRequest.fromJson(Map<String, dynamic> json) =>
      _$FcmRequestFromJson(json);
}
