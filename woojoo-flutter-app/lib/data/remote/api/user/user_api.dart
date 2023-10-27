import 'package:woojoo/data/dto/dto_user_info.dart';
import 'package:woojoo/data/remote/api/user/user_client.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

class UserApi {

  final UserClient _client = UserClient(DioClient.dio);

  UserApi._();

  static UserApi instance = UserApi._();

  Future<UserInfo> getUserInfo(int userId) async {
    return await _client.getUserInfo(userId);


  }

  // Future<UserInfo> getUserInfo(int userId) async {
  //   Response response = await dio.get('/users/$userId');
  //   return {
  //     'userProfile': response.data['userProfile'],
  //     'isFriend': response.data['isFriend'],
  //     'userGroups': response.data['userGroups'],
  //     'userGames': response.data['userGames'],
  //     'alreadyFriends': response.data['alreadyFriends'],
  //     'userFriends': response.data['userFriends']
  //   };
  // }
}
