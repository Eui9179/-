import 'package:dio/dio.dart';
import 'package:woojoo/data/dto/dto_group.dart';
import 'package:woojoo/data/remote/api/group/group_repository.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

class GroupApi implements GroupRepository {
  Dio dio = DioClient.dio;

  GroupApi._();

  static GroupApi instance = GroupApi._();

  @override
  Future<Group> getMyGroup() async {
    final response = await dio.get('/groups/me');
    return Group.fromJson(response.data);
  }
}
