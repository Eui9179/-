import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_todays_game.freezed.dart';
part 'dto_todays_game.g.dart';

@freezed
class TodaysGame with _$TodaysGame {
  factory TodaysGame({
    @JsonKey(name: 'todays_game_id') required int id,
    @JsonKey(name: 'id') required int userId,
    @JsonKey(name: 'name') required String userName,
    @JsonKey(name: 'profile_image_name') required String? profileImageName,
    @JsonKey(name: 'game') required String gameName,
    @JsonKey(name: 'game_nickname') required String? gameNickname,
    @JsonKey(name: 'create_time') required String createdTime,
    @JsonKey(name: 'introduction') required String? description,
    @JsonKey(name: 'isme') required bool isMe,
  }) = _TodaysGame;

  factory TodaysGame.fromJson(Map<String, dynamic> json) =>
      _$TodaysGameFromJson(json);
}
