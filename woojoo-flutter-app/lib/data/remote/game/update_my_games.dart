import 'dart:convert';
import 'package:dio/dio.dart';

import '../dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiUpdateMyGames(
    String? accessToken, List<String> gameList) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;

  try {
    Response response = await dio.post("/games", data: jsonEncode(gameList));
    return {
      "statusCode": response.statusCode,
      'data': response.data['my_games']
    };
    // return {"statusCode": 200, 'data': [{"game":"leagueoflegends", "nickname": "eui"}]};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
