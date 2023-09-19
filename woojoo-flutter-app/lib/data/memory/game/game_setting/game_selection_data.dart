import 'package:get/get.dart';
import 'package:woojoo/data/memory/game/game_data.dart';

import '../../../../utils/woojoo_games.dart';
import 'vo_game_selection.dart';

List<String> gameList = getWoojooGameList();

class GameSelectionData extends GetxController with GameDataProvider {
  RxList<GameSelection> gameSelectionList = <GameSelection>[].obs;
  List<String> myGameList =
      Get.find<GameData>().myGameList.map((game) => game.name).toList();

  @override
  void onInit() {
    for (String name in gameList) {
      GameSelection game = GameSelection(name: name);
      if (myGameList.contains(name)) game.toggle();
      gameSelectionList.add(game);
    }
    super.onInit();
  }

  Future<void> submitSelectedGameList() async {
    await gameData.updateMyGameList(getSelectedGameList());
  }

  List<String> getSelectedGameList() {
    return gameSelectionList
        .where((game) => game.isSelected)
        .map((game) => game.name)
        .toList();
  }
}

mixin class GameSelectionDataProvider {
  late final gameSelectionData = Get.find<GameSelectionData>();
}
