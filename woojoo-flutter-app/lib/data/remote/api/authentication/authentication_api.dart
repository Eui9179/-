import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:woojoo/data/dto/dto_access_token.dart';
import 'package:woojoo/data/dto/dto_login_request.dart';
import 'package:woojoo/data/dto/dto_signup_request.dart';
import 'package:woojoo/data/remote/api/authentication/authentication_repository.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

@Singleton(as: AuthenticationRepository)
class AuthenticationApi implements AuthenticationRepository {
  Dio dio = DioClient.dio;

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
  Future<int> withdrawal() async {
    Response response = await dio.delete('/auth/withdrawal');
    return response.statusCode ?? 500;
  }
}
