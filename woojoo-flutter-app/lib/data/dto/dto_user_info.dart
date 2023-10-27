import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:woojoo/data/dto/dto_game.dart';
import 'package:woojoo/data/dto/dto_user_simple.dart';

import 'dto_friend_in_list.dart';
import 'dto_group.dart';

part 'dto_user_info.freezed.dart';
part 'dto_user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  factory UserInfo({
    required UserSimple userSimple,
    required bool isFriend,
    required Group group,
    required List<Game> games,
    required List<UserInList> alreadyFriends,
    required List<UserInList> userFriends,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}