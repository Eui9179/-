import 'package:dio/dio.dart';
import 'package:woojoo/data/remote/dio/authorization_interceptor.dart';
import 'package:woojoo/data/remote/dio/endpoints.dart';

const String cdnProfileImageBaseUri =
    "http://localhost:8080/api/users/profile/image/";
const String imageBaseUrl = "http://localhost:8080/api/image";
const String profileImageUrl = "http://localhost:8080/api/users/profile/image";
// String cdnProfileImageBaseUri = "http://43.201.193.44/api/users/profile/image/";

class DioClient {
  DioClient._();

  final _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUri,
      connectTimeout: Endpoints.connectTimeout,
      receiveTimeout: Endpoints.receiveTimeout,
      responseType: ResponseType.json,
      contentType: Endpoints.connectType,
    )
  )..interceptors.addAll([
    AuthorizationInterceptor()
  ]);

  static Dio get dio => DioClient._()._dio;
}
