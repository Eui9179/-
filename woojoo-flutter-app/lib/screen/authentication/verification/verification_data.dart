import '../../../remote/authentication/login.dart';
import '../../../remote/authentication/verification/VerificationApi.dart';
import '../../../utils/notification.dart';

abstract mixin class VerificationData {
  final verification = VerificationApi.instance;

  Future<int?> verifySmsCode(String phoneNumber, String smsCode) {
    final statusCode = verification.verifySmsCode(phoneNumber, smsCode);
    return statusCode;
  }
}