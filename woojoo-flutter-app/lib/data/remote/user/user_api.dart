import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/user/dto_fcm_request.dart';
import 'package:woojoo/data/memory/user/dto_user_simple.dart';
import 'package:woojoo/data/memory/user/update_my_profile_request.dart';
import 'package:woojoo/data/remote/dio_instance.dart';
import 'package:woojoo/data/remote/user/user_repository.dart';

class UserApi implements UserRepository {
  final Dio dio = DioInstance(
    accessToken: g.Get.find<AccessTokenData>().accessToken,
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
      '/auth/sync-token',
      data: request.toJson(),
    );
    return response.statusCode ?? 500;
  }

  @override
  Future<String?> updateMyProfile(UpdateMyProfileRequest request) async {
    FormData formData = FormData.fromMap(await request.toJson());
    Response response = await dio.post('/users/setting', data: formData);
    return response.data.toString();
  }
}
