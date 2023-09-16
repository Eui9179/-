abstract interface class VerificationRepository {
  Future<int?> sendSms(String phoneNumber);

  Future<int?> verifySmsCode(String phoneNumber, String smsCode);
}
