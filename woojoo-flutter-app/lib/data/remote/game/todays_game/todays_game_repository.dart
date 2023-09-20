import 'package:woojoo/data/memory/game/todays_game/dto_todays_game_request.dart';

abstract interface class TodaysGameRepository {
  Future<void> insertTodaysGames(TodaysGameRequest request);
}