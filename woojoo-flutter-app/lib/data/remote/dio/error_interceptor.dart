import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:woojoo/screen/authentication/s_login.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch(err.response?.statusCode) {
      case 403:
        goToLoginScreen();
    }
    super.onError(err, handler);
  }

  void goToLoginScreen() {
    Get.offAll(
          () => const LoginScreen(),
      transition: Transition.downToUp,
      arguments: '403',
    );
  }
}