import 'package:get/get.dart';
import 'package:woojoo/data/memory/game/todays_game/dto_todays_game_request.dart';
import 'package:woojoo/data/remote/game/todays_game/todays_game_repository.dart';

import '../../../remote/game/todays_game/todays_game_api.dart';
import 'dto_todays_game.dart';

// TODO todaysGameList RX 데이터
class TodaysGameData extends GetxController {
  RxList<TodaysGame> todaysGameList = <TodaysGame>[].obs;

  final TodaysGameRepository todaysGameRepository = TodaysGameApi.instance;

  Future<void> insertTodaysGame(TodaysGameRequest request) async {
    todaysGameRepository.insertTodaysGames(request);
  }
}

mixin class TodaysGameDataProvider {
  late final todaysGameData = Get.find<TodaysGameData>();
}