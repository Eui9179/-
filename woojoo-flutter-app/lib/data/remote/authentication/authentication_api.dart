import 'package:dio/dio.dart';
import 'package:woojoo/data/memory/authentication/dto_access_token.dart';
import 'package:woojoo/data/memory/authentication/dto_login_request.dart';
import 'package:woojoo/data/memory/authentication/dto_signup_request.dart';
import 'package:woojoo/data/remote/authentication/authentication_repository.dart';

import '../dio/dio_instance.dart';

class AuthenticationApi implements AuthenticationRepository {
  Dio dio = DioClient.dio;

  AuthenticationApi._();

  static AuthenticationApi instance = AuthenticationApi._();

  @override
  Future<AccessToken> login(LoginRequest request) async {
    try {
      Response response = await dio.post(
        '/auth/login',
        data: request.toJson(),
      );
      return AccessToken.fromJson(response);
    } catch (e) {
      return AccessToken(statusCode: 401);
    }
  }

  @override
  Future<AccessToken> signup(SignupRequest request) async {
    Response response = await dio.post(
      '/auth/signup',
      data: request.toForm(),
    );
    return AccessToken.fromJson(response);
  }

  @override
  Future<int> withdrawal(String accessToken) async {
    setDioHeaderAccessToken(accessToken);
    Response response = await dio.delete('/auth/withdrawal');
    return response.statusCode ?? 500;
  }

  void setDioHeaderAccessToken(String accessToken) {
    dio.options.headers["authorization"] = "Bearer $accessToken";
    dio.options.headers["content-Type"] = 'application/json';
  }
}
