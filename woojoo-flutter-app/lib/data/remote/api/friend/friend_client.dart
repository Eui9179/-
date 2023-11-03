import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:woojoo/data/dto/dto_friend_id.dart';
import 'package:woojoo/data/dto/dto_friend_in_list.dart';

part 'friend_client.g.dart';

@RestApi()
abstract class FriendClient {
  factory FriendClient(Dio dio) => _FriendClient(dio);

  @GET('/friends/me')
  Future<List<UserInList>> getMyFriendList();

  @POST('/friends/sync')
  Future<void> syncFriendList(@Body() List<String> phoneNumberList);

  @POST('/friend')
  Future<UserInList> insertFriend(@Body() FriendId friendId);

  @DELETE('/friend/{friendId}')
  Future<void> deleteFriend(@Path() FriendId friendId);

  @POST('/block')
  Future<void> blockUser(@Body() FriendId userId);
}