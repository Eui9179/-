
import 'package:dio/dio.dart';

String baseUri = "http://localhost:8080/api";
// String baseUri = "http://43.201.193.44/api";

String cdnProfileImageBaseUri = "http://localhost:8080/api/users/profile/image/";
// String cdnProfileImageBaseUri = "http://43.201.193.44/api/users/profile/image/";

class DioInstance{
  final _dio = Dio();
  final String? accessToken;

  DioInstance(this.accessToken) {
    _dio.options.baseUrl = baseUri;
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 3000;
    if(accessToken != null){
      _dio.options.headers["authorization"] = "Bearer $accessToken";
      _dio.options.headers["content-Type"] = 'application/json';
    }
  }

  Dio get dio => _dio;
}