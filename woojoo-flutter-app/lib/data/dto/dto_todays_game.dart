import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_todays_game.freezed.dart';
part 'dto_todays_game.g.dart';

@freezed
class TodaysGame with _$TodaysGame {
  factory TodaysGame({
    required int id,
    required int userId,
    required String userName,
    required String? profileImageName,
    required String gameName,
    required String? gameNickname,
    required String createdTime,
    required String? description,
    required bool isMe,
  }) = _TodaysGame;

  factory TodaysGame.fromJson(Map<String, dynamic> json) =>
      _$TodaysGameFromJson(json);
}
