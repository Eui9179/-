import '../../memory/authentication/dto_access_token.dart';
import '../../memory/authentication/dto_login_request.dart';
import '../../memory/authentication/dto_signup_request.dart';

abstract interface class AuthenticationRepository {
  Future<AccessToken> login(LoginRequest request);
  Future<AccessToken> signup(SignupRequest request);
  Future<int> withdrawal(String accessToken);
}