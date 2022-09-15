import 'package:dio/dio.dart';
import 'package:dor_app/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiBlockUser(accessToken, int friendId) async {
  Dio dio = DioInstance(accessToken).dio;
  try {
    Response response =
        await dio.post('/user/block', data: {'friend_id': friendId});
    return {"statusCode": response.statusCode};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  }
}
