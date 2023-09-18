import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/authentication/verification/verification_data.dart';
import 'package:woojoo/data/remote/authentication_api.dart';

import 'dto_access_token.dart';
import 'dto_login_request.dart';
import 'dto_signup_request.dart';

mixin class AuthenticationDataProvider {
  late final AuthenticationData authenticationData = AuthenticationData();
  late final VerificationData verificationData = VerificationData();
}

class AuthenticationData with AccessTokenDataProvider {
  final authRepository = AuthenticationApi.instance;

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
        await authRepository.withdrawal(accessTokenData.accessToken);
    accessTokenData.clear();
    return statusCode;
  }
}

