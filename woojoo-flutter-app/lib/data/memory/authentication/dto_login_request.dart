import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_login_request.freezed.dart';
part 'dto_login_request.g.dart';

@freezed
class LoginRequest with _$LoginRequest {

  factory LoginRequest({
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'fcm_token') required String fcm,
    @JsonKey(name: 'sms_code') required String verificationCode,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}
