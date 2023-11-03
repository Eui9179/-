import 'package:woojoo/data/dto/dto_friend_in_list.dart';

abstract interface class FriendRepository {
  Future<List<UserInList>> getMyFriendList();
  Future<void> syncFriendList(List<String> phoneNumberList);
  Future<UserInList> insertFriend(int friendId);
  Future<void> deleteFriend(int friendId);
  Future<void> blockUser(int userId);
}