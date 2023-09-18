import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../screen/authentication/s_login.dart';

String baseUri = "http://localhost:8080/api";
// String baseUri = "http://43.201.193.44/api";

const String cdnProfileImageBaseUri =
    "http://localhost:8080/api/users/profile/image/";
const String imageBaseUrl = "http://localhost:8080/api/image";
const String profileImageUrl = "http://localhost:8080/api/users/profile/image";
// String cdnProfileImageBaseUri = "http://43.201.193.44/api/users/profile/image/";

class DioInstance {
  final _dio = Dio();
  String? accessToken;

  DioInstance({this.accessToken}) {
    _dio.options.baseUrl = baseUri;
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 3000;
    if (accessToken != null) {
      _dio.options.headers["authorization"] = "Bearer $accessToken";
      _dio.options.headers["content-Type"] = 'application/json';
    }
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError error, ErrorInterceptorHandler handler) async {
        if (error.response?.statusCode == 403) {
          Get.offAll(
            () => const LoginScreen(),
            transition: Transition.downToUp,
            arguments: '403', //TODO 파라미터 설정
          );
        }
        log('${error.requestOptions.path} ${error.message}');
        handler.resolve(error.response!);
      },
    ));
  }

  Dio get dio => _dio;
}
