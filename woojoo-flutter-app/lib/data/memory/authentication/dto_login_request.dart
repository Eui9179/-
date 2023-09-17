class LoginRequest {
  final String phoneNumber;
  final String fcm;
  final String verificationCode;

  LoginRequest({
    required this.phoneNumber,
    required this.fcm,
    required this.verificationCode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "phone_number": phoneNumber,
      "fcm_token": fcm,
      "sms_code": verificationCode,
    };
  }
}
