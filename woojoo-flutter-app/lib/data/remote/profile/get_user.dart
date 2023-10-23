import 'package:dio/dio.dart';

import '../dio_instance.dart';

Future<Map<String, dynamic>> dioApiUser(String accessToken, int userId) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;
  try {
    Response response = await dio.get('/users/$userId');
    return {
      'statusCode': response.statusCode,
      'data': {
        'userProfile': response.data['userProfile'],
        'isFriend': response.data['isFriend'],
        'userGroups': response.data['userGroups'],
        'userGames': response.data['userGames'],
        'alreadyFriends': response.data['alreadyFriends'],
        'userFriends': response.data['userFriends']
      }
    };
  } on DioError catch (error) {
    return {'statusCode': error.response!.statusCode};
  } finally {
    dio.close();
  }
}
