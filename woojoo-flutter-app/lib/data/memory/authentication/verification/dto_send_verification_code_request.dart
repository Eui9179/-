class SendVerificationCodeRequest {
  final String phoneNumber;

  SendVerificationCodeRequest({
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phone_number': phoneNumber,
    };
  }
}
