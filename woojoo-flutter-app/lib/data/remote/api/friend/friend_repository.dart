import 'package:woojoo/data/dto/dto_friend_in_list.dart';

abstract interface class FriendRepository {
  Future<List<UserInList>> getMyFriendList();
  Future<void> syncFriendList(List<String> phoneNumberList);
}