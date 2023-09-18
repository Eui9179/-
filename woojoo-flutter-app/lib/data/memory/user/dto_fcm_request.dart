class FcmRequest {
  final String fcm;

  FcmRequest({required this.fcm});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "fcm_token": fcm
    };
  }
}