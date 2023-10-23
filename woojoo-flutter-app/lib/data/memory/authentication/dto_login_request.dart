import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_login_request.freezed.dart';
part 'dto_login_request.g.dart';

@freezed
class LoginRequest with _$LoginRequest {

  factory LoginRequest({
    required String phoneNumber,
    required String fcm,
    required String verificationCode,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}
