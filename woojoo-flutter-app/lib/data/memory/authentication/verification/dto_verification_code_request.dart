class VerificationCodeRequest {
  final String phoneNumber;
  final String cp;

  VerificationCodeRequest({required this.phoneNumber, required this.cp});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phone_number': phoneNumber,
      'cp': cp
    };
  }
}