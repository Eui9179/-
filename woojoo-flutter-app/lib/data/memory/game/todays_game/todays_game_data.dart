import 'package:get/get.dart';
import 'package:woojoo/data/memory/game/todays_game/dto_todays_game_request.dart';
import 'package:woojoo/data/remote/game/todays_game/todays_game_repository.dart';

import '../../../remote/game/todays_game/todays_game_api.dart';
import 'dto_todays_game.dart';

class TodaysGameData extends GetxController {
  RxList<TodaysGame> todaysGameList = <TodaysGame>[].obs;
  final TodaysGameRepository todaysGameRepository = TodaysGameApi.instance;

  @override
  void onInit() async {
    getTodaysGameList();
    super.onInit();
  }

  Future<void> getTodaysGameList() async {
    List<TodaysGame> response = await todaysGameRepository.getTodaysGames();
    todaysGameList.clear();
    todaysGameList.addAll(response);
  }

  Future<void> insertTodaysGame(TodaysGameRequest request) async {
    todaysGameRepository.insertTodaysGames(request);
  }

  Future<void> deleteTodaysGame(int id, int index) async {
    await todaysGameRepository.deleteTodaysGames(id);
    todaysGameList.removeAt(index);
  }

  String resolveTime(String time) {
    return time.split('T')[1].substring(0, 5);
  }
}

mixin class TodaysGameDataProvider {
  late final todaysGameData = Get.find<TodaysGameData>();
}