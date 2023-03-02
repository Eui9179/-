import 'package:dor_app/dio/dio_instance.dart';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> dioApiLogin(String phoneNumber, String fcmToken) async {

  return {"statusCode": 401, "data": "test"};
  // return {"statusCode": 401, "data": "test"};
  // Dio dio = DioInstance(null).dio;
  
  // try {
  //   Response response = await dio.post('/auth/login',
  //       data: {"phone_number": phoneNumber, "fcm_token": fcmToken});
  //   return {"statusCode": 200, "data": response.data["access_token"]};
  // } on DioError catch (error) {
  //   print("dio login error code: ${error.response!.statusCode}");
  //   return {"statusCode": error.response!.statusCode};
  // } finally {
  //   dio.close();
  // }
}
