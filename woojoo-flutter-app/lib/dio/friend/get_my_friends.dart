import 'package:dio/dio.dart';
import 'package:dor_app/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiGetMyFriends(String? accessToken) async {
  Dio dio = DioInstance(accessToken).dio;
  try {
    // Response response = await dio.get('/user/friends/me');
    // return {
    //   "statusCode": response.statusCode,
    //   "data": response.data["my_friends"]
    // };
    return {
      "statusCode": 200,
      "data": [
        {
            "id": 10,
            "name": "김지원",
            "profile_image_name": "default",
            "games": ["leagueoflegends"],
        },
        {
            "id": 11,
            "name": "이지원",
            "profile_image_name": "default",
            "games": ["lostark", "leagueoflegends"],
        },
        {
            "id": 12,
            "name": "호영훈",
            "profile_image_name": "default",
            "games": ["lostark", "battleground"],
        }
      ]
    };
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
