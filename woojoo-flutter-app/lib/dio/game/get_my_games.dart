import 'package:dio/dio.dart';
import 'package:dor_app/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiGetMyGames(String? accessToken) async {
  Dio dio = DioInstance(accessToken).dio;
  try {
    // Response response = await dio.get('/games/me');
    // return {"statusCode": 200, "data": response.data["my_games"]};
    return {
      "statusCode": 200, 
      "data": [
          {"game": "leagueoflegends", "nickname": "이꾸릉이"},
          {"game": "battleground", "nickname": "이꾸릉이"},
          {"game": "lostark", "nickname": "leui"},
        ]
    };
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  }
}
