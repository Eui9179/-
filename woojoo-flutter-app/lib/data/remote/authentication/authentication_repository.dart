import '../../memory/authentication/dto_access_token_response.dart';
import '../../memory/authentication/dto_fcm_request.dart';
import '../../memory/authentication/dto_login_request.dart';
import '../../memory/authentication/dto_signup_request.dart';

abstract interface class AuthenticationRepository {
  Future<int> syncFcm(FcmRequest request);
  Future<AccessTokenResponse> login(LoginRequest request);
  Future<AccessTokenResponse> signup(SignupRequest request);
  Future<int> withdrawal(String accessToken);
}