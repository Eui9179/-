import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:woojoo/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiSyncMyFriendsiends(
    String? accessToken, List<String?> contacts) async {
  Dio dio = DioInstance(accessToken).dio;

  try {
    Response response =
        await dio.post('/friends/sync', data: jsonEncode(contacts));
    return {"statusCode": response.statusCode};
  } on DioError catch (error) {
    print(error);
    return {"statusCode": error.response!.statusCode};
  }
}
