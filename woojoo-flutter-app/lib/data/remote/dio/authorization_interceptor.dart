import 'package:dio/dio.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';

class AuthorizationInterceptor extends Interceptor
    with AccessTokenDataProvider {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String accessToken = accessTokenData.accessToken;
    if (accessToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }
    super.onRequest(options, handler);
  }
}
