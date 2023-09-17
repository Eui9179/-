import 'package:dio/dio.dart';

class AccessTokenResponse {
  final int statusCode;
  final String? accessToken;

  AccessTokenResponse({required this.statusCode, required this.accessToken});

  factory AccessTokenResponse.fromJson(Response response) {
    return AccessTokenResponse(
      statusCode: response.statusCode!,
      accessToken: response.data["access_token"],
    );
  }
}
