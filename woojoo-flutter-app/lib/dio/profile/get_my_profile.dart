import 'package:dio/dio.dart';
import 'package:dor_app/dio/dio_instance.dart';

Future<Map<String, dynamic>> dioApiGetMyProfile(accessToken) async {
  Dio dio = DioInstance(accessToken).dio;
  try {
    //test
    // Response response = await dio.get('/user/profile/me');
    // return {"statusCode": 200, "data": response.data["my_profile"]};
    return {"statusCode": 200, "data": {"id": 10, "name":"이의찬", "phone_number": "11111111", "profile_image_name": "default"}};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  }
}
