
import 'package:woojoo/data/dto/dto_access_token.dart';
import 'package:woojoo/data/dto/dto_login_request.dart';
import 'package:woojoo/data/dto/dto_signup_request.dart';

abstract interface class AuthenticationRepository {
  Future<AccessToken> login(LoginRequest request);
  Future<AccessToken> signup(SignupRequest request);
  Future<int> withdrawal();
}