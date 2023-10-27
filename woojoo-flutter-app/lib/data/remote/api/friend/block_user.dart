import 'package:dio/dio.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiBlockUser(accessToken, int friendId) async {
  Dio dio = DioClient.dio;
  try {
    Response response = await dio.post('/block', data: {'friendId': friendId});
    return {"statusCode": response.statusCode};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  }
}
