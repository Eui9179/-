import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:woojoo/data/remote/group/group_repository.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/group/dto_group.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';



class GroupApi implements GroupRepository {
  Dio dio = DioClient.dio;

  GroupApi._();

  static GroupApi instance = GroupApi._();

  @override
  Future<Group> getMyGroup() async {
    final response= await dio.get('/groups/me');
    return Group.fromJson(response.data);
  }
}
