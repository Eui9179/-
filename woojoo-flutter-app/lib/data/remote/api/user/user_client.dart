import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:woojoo/data/dto/dto_user_info.dart';

part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio) => _UserClient(dio);

  @GET('/users/{userId}')
  Future<UserInfo> getUserInfo(@Path('userId') int userId);
}