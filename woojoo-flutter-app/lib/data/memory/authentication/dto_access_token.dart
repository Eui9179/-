import 'package:dio/dio.dart';

class AccessToken {
  final int statusCode;
  final String? accessToken;

  AccessToken({required this.statusCode, required this.accessToken});

  factory AccessToken.fromJson(Response response) {
    return AccessToken(
      statusCode: response.statusCode!,
      accessToken: response.data["access_token"],
    );
  }
}
