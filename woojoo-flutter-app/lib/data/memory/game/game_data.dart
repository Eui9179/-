import 'package:get/get.dart';
import 'package:woojoo/data/remote/game/game_api.dart';
import 'package:woojoo/data/remote/game/game_repository.dart';

import 'dto_game.dart';

class GameData extends GetxController {
  RxList<Game> myGameList = <Game>[].obs;

  final GameRepository gameRepository = GameApi.instance;

  @override
  void onInit() async {
    getMyGameList();
    super.onInit();
  }

  void getMyGameList() async {
    myGameList.clear();
    List<Game> gameList = await gameRepository.getMyGameList();
    myGameList.addAll(gameList);
  }

  Future<void> updateMyGameList(List<String> selectedGameList) async {
    myGameList.clear();
    List<Game> updatedGameList =
        await gameRepository.updateMyGameList(selectedGameList);
    myGameList.addAll(updatedGameList);
  }

  void clear() {
    myGameList.clear();
  }
}

mixin class GameDataProvider {
  late final GameData gameData = Get.find<GameData>();
}
