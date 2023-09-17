import 'package:dio/dio.dart';

import '../dio_instance.dart';

Future<Map<String, dynamic>> dioApiGetMyProfile(accessToken) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;
  try {
    Response response = await dio.get('/users/me');
    return {"statusCode": 200, "data": response.data};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  }
}
