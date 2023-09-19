import 'package:get/get.dart';
import 'package:woojoo/data/remote/game/game_api.dart';
import 'package:woojoo/data/remote/game/game_repository.dart';

import 'dto_game.dart';

class GameData extends GetxController {
  RxList<Game> myGameList = <Game>[].obs;

  final GameRepository gameRepository = GameApi.instance;

  @override
  void onInit() async {
    List<Game> gameList = await gameRepository.getMyGameList();
    myGameList.addAll(gameList);
    super.onInit();
  }
}

mixin class GameDataProvider {
  late final GameData gameData = Get.find<GameData>();
}