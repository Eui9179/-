import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_game_nickname.g.dart';
part 'dto_game_nickname.freezed.dart';

@freezed
class GameNickname with _$GameNickname {
  factory GameNickname({
    required String game,
    required String nickname,
  }) = _GameNickname;

  factory GameNickname.fromJson(Map<String, dynamic> json) =>
      _$GameNicknameFromJson(json);
}
