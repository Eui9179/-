import 'package:woojoo/dio/dio_instance.dart';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> dioApiSendSms(String phoneNumber) async {
  Dio dio = DioInstance(null).dio;

  try {
    Response response = await dio.post(
      '/sms-code',
      data: {"phone_number": phoneNumber},
    );
    return {"statusCode": 200};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
