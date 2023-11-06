import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/data/dto/dto_access_token.dart';
import 'package:woojoo/data/dto/dto_login_request.dart';
import 'package:woojoo/data/dto/dto_signup_request.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/authentication/verification/verification_data.dart';
import 'package:woojoo/data/remote/api/authentication/authentication_repository.dart';

mixin class AuthenticationDataProvider {
  late final AuthenticationData authenticationData = AuthenticationData();
  late final VerificationData verificationData = VerificationData();
}

class AuthenticationData with AccessTokenDataProvider {
  final authRepository = getIt.get<AuthenticationRepository>();

  Future<AccessToken> login(LoginRequest request) async {
    AccessToken accessTokenResponse =
        await authRepository.login(request);
    int statusCode = accessTokenResponse.statusCode;
    String? accessToken = accessTokenResponse.accessToken;

    if (statusCode == 200 && accessToken != null) {
      accessTokenData.accessToken = accessToken;
    }

    return accessTokenResponse;
  }

  void signup(SignupRequest request) async {
    final AccessToken response = await authRepository.signup(request);
    String? accessToken = response.accessToken;

    if (response.statusCode == 200 && accessToken != null) {
      accessTokenData.accessToken = accessToken;
    }
  }

  Future<int> withdrawal() async {
    int statusCode =
        await authRepository.withdrawal();
    accessTokenData.clear();
    return statusCode;
  }
}

