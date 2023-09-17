class VerifyCodeRequest {
  final String phoneNumber;
  final String cp;

  VerifyCodeRequest({required this.phoneNumber, required this.cp});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phone_number': phoneNumber,
      'cp': cp
    };
  }
}