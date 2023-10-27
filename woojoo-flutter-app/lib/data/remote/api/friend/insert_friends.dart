import 'package:dio/dio.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiInsertFriends(List<int> peopleToBeFriends) async {
  Dio dio = DioClient.dio;

  try {
    Response response = await dio.post('/friends', data: peopleToBeFriends);
    return {
      'statusCode': response.statusCode,
      'data': response.data['new_friends']
    };
  } on DioError catch (error) {
    return {
      'statusCode': error.response!.statusCode,
    };
  } finally {
    dio.close();
  }
}
