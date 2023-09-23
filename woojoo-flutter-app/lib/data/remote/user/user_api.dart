import 'package:dio/dio.dart';
import 'package:get/get.dart' as G;
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/user/dto_fcm_request.dart';
import 'package:woojoo/data/memory/user/dto_user_simple.dart';
import 'package:woojoo/data/memory/user/update_my_profile_request.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';
import 'package:woojoo/data/remote/user/user_repository.dart';

class UserApi implements UserRepository {
  final Dio dio = DioInstance(
    accessToken: G.Get.find<AccessTokenData>().accessToken,
  ).dio;

  UserApi._();

  static UserApi instance = UserApi._();

  @override
  Future<UserSimple> getMyProfile() async {
    final response = await dio.get('/users/me');
    return UserSimple.fromJson(response.data);
  }

  @override
  Future<int> syncFcm(FcmRequest request) async {
    final response = await dio.post(
      '/auth/async-token',
      data: request.toJson(),
    );
    return response.statusCode ?? 500;
  }

  @override
  Future<String> updateMyProfile(UpdateMyProfileRequest request) async {
    ///? await MultipartFile.fromFile(profileData["file"].path)
    //     : null,
    FormData formData = FormData.fromMap(await request.toJson());
    Response response = await dio.post('/users/setting', data: formData);
    return response.data;
  }
}
