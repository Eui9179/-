import 'package:dio/dio.dart';

import '../dio_instance.dart';

Future<Map<String, dynamic>> dioApiInsertFriendOne(
    String accessToken, int friendId) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;

  try {
    Response response =
        await dio.post('/friend', data: {'friendId': friendId});
    return {
      'statusCode': response.statusCode,
      'data': response.data['newFriend']
    };
  } on DioError catch (error) {
    return {
      'statusCode': error.response!.statusCode,
    };
  } finally {
    dio.close();
  }
}
