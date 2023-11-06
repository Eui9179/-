import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:woojoo/data/dto/dto_group.dart';
import 'package:woojoo/data/remote/api/group/group_repository.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

@Singleton(as: GroupRepository)
class GroupApi implements GroupRepository {
  Dio dio = DioClient.dio;

  @override
  Future<Group> getMyGroup() async {
    final response = await dio.get('/groups/me');
    return Group.fromJson(response.data);
  }
}
