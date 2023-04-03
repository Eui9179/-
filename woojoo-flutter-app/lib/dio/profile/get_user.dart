import 'package:dio/dio.dart';
import 'package:woojoo/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiUser(String accessToken, int userId) async {
  Dio dio = DioInstance(accessToken).dio;
  try {
    Response response = await dio.get('/users/$userId');
    return {
      'statusCode': response.statusCode,
      'data': {
        'userProfile': response.data['user_profile'],
        'isFriend': response.data['is_friend'],
        'userGroups': response.data['user_groups'],
        'userGames': response.data['user_games'],
        'alreadyFriends': response.data['already_friends'],
        'userFriends': response.data['user_friends']
      }
    };
  } on DioError catch (error) {
    return {'statusCode': error.response!.statusCode};
  } finally {
    dio.close();
  }
}
