import 'package:dio/dio.dart';

import '../dio_instance.dart';

Future<Map<String, dynamic>> dioApiGetFriendsByGroupDetail1(
    String? accessToken, String name, String detail1) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;
  try {
    Response response = await dio.get('/groups/$name/$detail1');
    return {
      "statusCode": response.statusCode,
      "people": response.data["people"],
      "friends": response.data["friends"]
    };
    // return {
    //   "statusCode": 200,
    //   "people": [
    //     {
    //       "id": 30,
    //       "name": "곽호진",
    //       "profile_image_name": "default",
    //       "games": ["leagueoflegends"],
    //     },
    //     {
    //       "id": 31,
    //       "name": "이현재",
    //       "profile_image_name": "default",
    //       "games": ["lostark", "leagueoflegends"],
    //     },
    //     {
    //       "id": 32,
    //       "name": "이동우",
    //       "profile_image_name": "default",
    //       "games": ["leagueoflegends", "battleground"],
    //     },
    //     {
    //       "id": 38,
    //       "name": "김준봉",
    //       "profile_image_name": "default",
    //       "games": ["lostark", "battleground"],
    //     },
    //   ],
    //   "friends": [
    //     {
    //       "id": 33,
    //       "name": "김민준",
    //       "profile_image_name": "default",
    //       "games": ["leagueoflegends"],
    //     },
    //     {
    //       "id": 34,
    //       "name": "김지원",
    //       "profile_image_name": "default",
    //       "games": ["leagueoflegends"],
    //     },
    //     {
    //       "id": 35,
    //       "name": "이지원",
    //       "profile_image_name": "default",
    //       "games": ["lostark", "leagueoflegends"],
    //     },
    //     {
    //       "id": 36,
    //       "name": "이성진",
    //       "profile_image_name": "default",
    //       "games": ["lostark", "leagueoflegends"],
    //     },
    //     {
    //       "id": 37,
    //       "name": "호영훈",
    //       "profile_image_name": "default",
    //       "games": ["lostark", "battleground"],
    //     },
    //   ],
    // };
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
