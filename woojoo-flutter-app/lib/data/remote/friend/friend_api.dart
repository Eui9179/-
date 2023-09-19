import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../memory/authentication/access_token_data.dart';
import '../../memory/friend/dto_friend_simple.dart';
import '../dio/dio_instance.dart';
import 'friend_repository.dart';

class FriendApi implements FriendRepository {
  final Dio dio = DioInstance(
    accessToken: Get.find<AccessTokenData>().accessToken,
  ).dio;

  FriendApi._();

  static FriendApi instance = FriendApi._();

  @override
  Future<List<FriendSimple>> getMyFriendList() async {
    final response = await dio.get<List>('/friends/me');
    return response.data?.map((e) => FriendSimple.fromJson(e)).toList() ?? [];
  }

  @override
  Future<void> syncFriendList(List<String> phoneNumberList) async {
      await dio.post('/friends/sync', data: jsonEncode(phoneNumberList));
  }
}
