import 'package:woojoo/data/memory/game/todays_game/dto_todays_game.dart';
import 'package:woojoo/data/memory/game/todays_game/dto_todays_game_request.dart';

abstract interface class TodaysGameRepository {
  Future<List<TodaysGame>> getTodaysGames();
  Future<void> insertTodaysGames(TodaysGameRequest request);
  Future<void> deleteTodaysGames(int id);
}