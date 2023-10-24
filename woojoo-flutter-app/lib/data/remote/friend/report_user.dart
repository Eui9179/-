import 'package:dio/dio.dart';

import '../dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiReportUser(
    accessToken, Map reportData) async {
  Dio dio = DioClient.dio;
  try {
    Response response = await dio.post('/admin/report', data: reportData);
    return {"statusCode": response.statusCode};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  }
}
