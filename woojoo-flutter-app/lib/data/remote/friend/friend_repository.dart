import '../../memory/friend/dto_friend_simple.dart';

abstract interface class FriendRepository {
  Future<List<FriendSimple>> getMyFriendList();
  Future<void> syncFriendList(List<String> phoneNumberList);
}