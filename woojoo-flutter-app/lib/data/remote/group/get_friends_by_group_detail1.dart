import 'package:dio/dio.dart';

import '../dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiGetFriendsByGroupDetail1(
    String? accessToken, String name, String detail1) async {
  Dio dio = DioClient.dio;
  try {
    Response response = await dio.get('/groups/$name/$detail1');
    return {
      "statusCode": response.statusCode,
      "people": response.data["people"],
      "friends": response.data["friends"]
    };
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
