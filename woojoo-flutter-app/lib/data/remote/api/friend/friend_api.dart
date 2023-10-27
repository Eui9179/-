import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:woojoo/data/dto/dto_friend_in_list.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

import 'friend_repository.dart';

class FriendApi implements FriendRepository {
  final Dio dio = DioClient.dio;

  FriendApi._();

  static FriendApi instance = FriendApi._();

  @override
  Future<List<UserInList>> getMyFriendList() async {
    final response = await dio.get<List>('/friends/me');
    return response.data?.map((e) => UserInList.fromJson(e)).toList() ?? [];
  }

  @override
  Future<void> syncFriendList(List<String> phoneNumberList) async {
      await dio.post('/friends/sync', data: jsonEncode(phoneNumberList));
  }
}
