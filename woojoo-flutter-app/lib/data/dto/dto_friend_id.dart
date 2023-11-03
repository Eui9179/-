import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_friend_id.freezed.dart';

part 'dto_friend_id.g.dart';

@freezed
class FriendId with _$FriendId {
  factory FriendId(int friendId) = _FriendId;

  factory FriendId.fromJson(Map<String, dynamic> json) =>
      _$FriendIdFromJson(json);
}
