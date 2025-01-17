import 'package:dio/dio.dart';

class AccessToken {
  final int statusCode;
  final String? accessToken;

  AccessToken({required this.statusCode, this.accessToken});

  factory AccessToken.fromJson(Response response) {
    return AccessToken(
      statusCode: response.statusCode!,
      accessToken: response.data["accessToken"],
    );
  }
}
