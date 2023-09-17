import 'dart:developer';

import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/authentication/verification/verification_data.dart';
import 'package:woojoo/data/remote/authentication/authentication_api.dart';

import 'dto_access_token_response.dart';
import 'dto_fcm_request.dart';
import 'dto_login_request.dart';
import 'dto_signup_request.dart';

class AuthenticationData with AccessTokenDataProvider {
  final authRepository = AuthenticationApi.instance;

  Future<AccessTokenResponse> login(LoginRequest request) async {
    AccessTokenResponse accessTokenResponse =
    await authRepository.login(request);
    int statusCode = accessTokenResponse.statusCode;
    String? accessToken = accessTokenResponse.accessToken;

    if (statusCode == 200 && accessToken != null) {
      accessTokenData.accessToken = accessToken;
    }

    return accessTokenResponse;
  }

  void signup(SignupRequest request) async {
    final AccessTokenResponse response = await authRepository.signup(request);
    String? accessToken = response.accessToken;

    if (response.statusCode == 200 && accessToken != null) {
      accessTokenData.accessToken = accessToken;
    }
  }

  void syncFcm(FcmRequest request) {
    authRepository.syncFcm(request).then((statusCode) {
      if (statusCode != 200) {
        log('syncFcm error code: $statusCode');
      }
    });
  }

  Future<int> withdrawal() async {
    int statusCode = await authRepository.withdrawal(accessTokenData.accessToken);
    accessTokenData.clear();
    return statusCode;
  }
}

mixin class AuthenticationDataProvider {
  late final AuthenticationData authenticationData = AuthenticationData();
  late final VerificationData verificationData = VerificationData();
}
