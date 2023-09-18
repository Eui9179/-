import 'package:dio/dio.dart';

import '../dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiGetMyFriends(String? accessToken) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;
  try {
    Response response = await dio.get('/friends/me');
    return {
      "statusCode": response.statusCode,
      "data": response.data["my_friends"]
    };
  } catch (error) {
    print(error);
    return {"statusCode": 500};
  } finally {
    dio.close();
  }
}
