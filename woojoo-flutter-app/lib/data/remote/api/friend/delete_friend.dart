import 'package:dio/dio.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiDeleteFriendOne(int friendId) async {
  Dio dio = DioClient.dio;

  try {
    Response response = await dio.delete('/friend/$friendId');
    return {
      'statusCode': response.statusCode,
    };
  } on DioError catch (error) {
    return {
      'statusCode': error.response!.statusCode,
    };
  } finally {
    dio.close();
  }
}
