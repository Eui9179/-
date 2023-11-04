import 'package:woojoo/data/dto/dto_game.dart';
import 'package:woojoo/data/dto/dto_game_nickname.dart';

abstract interface class GameRepository {
  Future<List<Game>> getMyGameList();
  Future<List<Game>> updateMyGameList(List<String> gameList);
  Future<void> updateGameNickname(GameNickname gameNickname);
}