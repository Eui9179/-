import 'package:woojoo/dio/dio_instance.dart';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> dioApiSendSms(String phoneNumber) async {
  Dio dio = DioInstance(null).dio;

  try {
    Response response =
        await dio.post('/sms', data: {"phone_number": phoneNumber});
    return {"statusCode": 200};
  } catch (error) {
    print(error);

    return {"statusCode": 500};

    // } on DioError catch (error) {
    //   print("dio login error code: ${error.response!.statusCode}");
    //   return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
