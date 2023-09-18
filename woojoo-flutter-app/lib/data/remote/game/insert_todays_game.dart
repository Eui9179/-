import 'package:dio/dio.dart';

import '../dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiInsertTodaysGame(
    String? accessToken, String game, String introduction) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;

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
