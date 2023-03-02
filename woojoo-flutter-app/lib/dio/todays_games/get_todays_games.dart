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
    // Response response = await dio.get('/games/todays');
    // return {"statusCode": 200, "data": response.data["result"]};
    return {"statusCode": 200, "data": [
      {
            'todays_game_id':1,
            "id": 2,
            "name": "김지원",
            "profile_image_name":"default",
            'game': "leagueoflegends",
            'game_nickname': "메트로마트",
            'introduction':"저녁에 바텀듀오 가실 분?",
            'create_time':"2023 03 02 22 17:23",
            'isme':false
        }, 
        {
            'todays_game_id':2,
            "id": 3,
            "name": "호영훈",
            "profile_image_name":"default",
            'game': "lostark",
            'game_nickname': "losthun",
            'introduction':"7시에 레이드 ㄱㄱ",
            'create_time':"2023 03 02 22 17:32",
            'isme':false
        },
        {
            'todays_game_id':3,
            "id": 12,
            "name": "이의찬",
            "profile_image_name":"default",
            'game': "leagueoflegends",
            'game_nickname': "이꾸릉이",
            'introduction':"골드3 듀오 ㄱㄱ",
            'create_time':"2023 03 02 22 18:02",
            'isme':true
        },
        {
            'todays_game_id':4,
            "id": 5,
            "name": "김민준",
            "profile_image_name":"default",
            'game': "leagueoflegends",
            'game_nickname': "배라알바생123",
            'introduction':"칼바람 하실분",
            'create_time':"2023 03 02 22 18:12",
            'isme':false
        },
    ]};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  }
}
