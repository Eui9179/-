import 'package:injectable/injectable.dart';
import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/data/dto/dto_user_info.dart';
import 'package:woojoo/data/remote/api/user/user_api.dart';

@singleton
class UserData {
  UserApi userApi = getIt.get<UserApi>();

  Future<UserInfo> getUserInfo(int userId) async {
    return await userApi.getUserInfo(userId);
  }

  Future<void> report(Map<String, dynamic> data) async {
    await userApi.report(data);
  }
}