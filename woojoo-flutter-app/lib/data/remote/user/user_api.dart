import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/user/dto_fcm_request.dart';
import 'package:woojoo/data/memory/user/dto_my_profile.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';
import 'package:woojoo/data/remote/user/user_repository.dart';

class UserApi implements UserRepository {
  final Dio dio = DioInstance(
    accessToken: Get.find<AccessTokenData>().accessToken,
  ).dio;

  UserApi._();

  static UserApi instance = UserApi._();

  @override
  Future<MyProfile> getMyProfile() async {
    final response = await dio.get('/users/me');
    return MyProfile.fromResponse(response);
  }

  @override
  Future<int> syncFcm(FcmRequest request) async {
    final response = await dio.post(
      '/auth/async-token',
      data: request.toJson(),
    );
    return response.statusCode ?? 500;
  }
}
