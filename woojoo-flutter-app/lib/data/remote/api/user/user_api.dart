import 'package:injectable/injectable.dart';
import 'package:woojoo/data/dto/dto_user_info.dart';
import 'package:woojoo/data/remote/api/user/user_client.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

@singleton
class UserApi {
  final UserClient _client = UserClient(DioClient.dio);

  Future<UserInfo> getUserInfo(int userId) async {
    return await _client.getUserInfo(userId);
  }

  Future<void> report(Map<String, dynamic> data) async {
    await _client.report(data);
  }
}
