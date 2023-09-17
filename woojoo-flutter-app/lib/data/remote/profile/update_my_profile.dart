import 'package:dio/dio.dart';

import '../dio_instance.dart';

Future<Map<String, dynamic>> dioApiUpdateMyProfile(
    Map profileData, String accessToken) async {
  FormData formData;
  Dio dio = DioInstance(accessToken: accessToken).dio;
  try {
    formData = FormData.fromMap({
      "is_file": profileData['isFile'],
      "file": profileData["file"] != null
          ? await MultipartFile.fromFile(profileData["file"].path)
          : null,
      "name": profileData["name"],
      "group_name": profileData['groupName'],
      "group_detail1": profileData['groupDetail1'],
      "is_group": profileData["isGroup"]
    });
    Response response = await dio.post('/users/setting', data: formData);
    return {
      "statusCode": response.statusCode,
      'data': response.data,
    };
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
