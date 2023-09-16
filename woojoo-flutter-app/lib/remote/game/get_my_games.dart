import 'package:dio/dio.dart';

import '../dio_instance.dart';

Future<Map<String, dynamic>> dioApiGetMyGames(String? accessToken) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;
  try {
    Response response = await dio.get('/games/me');
    return {"statusCode": 200, "data": response.data["my_games"]};
  } catch (error) {
    print(error);
    return {"statusCode": error};
  }
}
