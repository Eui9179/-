import 'package:woojoo/data/dto/dto_user_info.dart';
import 'package:woojoo/data/remote/api/user/user_api.dart';

class UserData {
  UserApi userApi = UserApi.instance;

  Future<UserInfo> getUserInfo(int userId) async {
    return await userApi.getUserInfo(userId);
  }

  Future<void> report(Map<String, dynamic> data) async {
    await userApi.report(data);
  }
}