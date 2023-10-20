import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_game.freezed.dart';

part 'dto_game.g.dart';

@unfreezed
class Game with _$Game {
  factory Game({
    @JsonKey(name: 'game') required String name,
    String? nickname,
  }) = _Game;

  factory Game.fromJson(Map<String, Object?> json) => _$GameFromJson(json);
}
