import 'package:dio/dio.dart';

import '../dio_instance.dart';

Future<Map<String, dynamic>> dioApiGetMyGroups(String? accessToken) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;
  try {
    Response response = await dio.get('/groups/me');
    return {
      "statusCode": response.statusCode,
      "data": response.data["my_groups"]
    };
    // return {
    //   "statusCode": 200,
    //   "data": [{"name":"상원고등학교", "detail1":"2"}]
    // };
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
