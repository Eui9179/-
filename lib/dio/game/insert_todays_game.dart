import 'package:dor_app/dio/dio_instance.dart';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> dioApiInsertTodaysGame(
    String? accessToken, String game, String introduction) async {
  Dio dio = DioInstance(accessToken).dio;

  try {
    Response response = await dio.post("/games/todays",
        data: {'game': game, 'introduction': introduction});
    return {"statusCode": response.statusCode};
  } catch (error) {
    print(error);
    return {"statusCode": '500'};
  } finally {
    dio.close();
  }
}
