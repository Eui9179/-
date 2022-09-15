import 'package:dio/dio.dart';
import 'package:dor_app/dio/dio_instance.dart';

/*
{
  "id": user_row.id,
  "name": user_row.name,
  "profile_image_name":user_row.profile_image_name,
  'game': todays_game.game,
  'introduction':todays_game.introduction,
  'create_time':todays_game.create_time,
}
*/

Future<Map<String, dynamic>> dioApiGetTodaysGames(accessToken) async {
  Dio dio = DioInstance(accessToken).dio;
  try {
    Response response = await dio.get('/games/todays');
    return {"statusCode": 200, "data": response.data["result"]};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  }
}
