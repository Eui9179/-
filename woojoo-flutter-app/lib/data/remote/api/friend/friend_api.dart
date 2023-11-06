import 'package:injectable/injectable.dart';
import 'package:woojoo/data/dto/dto_friend_id.dart';
import 'package:woojoo/data/dto/dto_friend_in_list.dart';
import 'package:woojoo/data/remote/api/friend/friend_client.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

import 'friend_repository.dart';

@Singleton(as: FriendRepository)
class FriendApi implements FriendRepository {

  final FriendClient _friendClient = FriendClient(DioClient.dio);

  @override
  Future<List<UserInList>> getMyFriendList() async {
    return _friendClient.getMyFriendList();
  }

  @override
  Future<void> syncFriendList(List<String> phoneNumberList) async {
    await _friendClient.syncFriendList(phoneNumberList);
  }

  @override
  Future<void> deleteFriend(int friendId) async {
    await _friendClient.deleteFriend(FriendId(friendId));
  }

  @override
  Future<UserInList> insertFriend(int friendId) async {
    return await _friendClient.insertFriend(FriendId(friendId));
  }

  @override
  Future<void> blockUser(int userId) async {
    await _friendClient.blockUser(FriendId(userId));
  }
}
