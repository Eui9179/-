import 'package:dio/dio.dart';
import 'package:dor_app/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiDeleteTodaysGame(
    String? accessToken, int todaysGameId) async {
  Dio dio = DioInstance(accessToken).dio;
  try {
    await dio.delete('/games/todays/$todaysGameId');
    return {'statusCode': 200};
  } on DioError catch (error) {
    return {'statusCode': error.response!.statusCode};
  }
}
