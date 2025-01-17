import 'package:get/get.dart';
import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/data/dto/dto_game_nickname.dart';
import 'package:woojoo/data/remote/api/game/game_api.dart';
import 'package:woojoo/data/remote/api/game/game_repository.dart';

import '../../dto/dto_game.dart';

class GameData extends GetxController {
  RxList<Game> myGameList = <Game>[].obs;

  final gameRepository = getIt.get<GameRepository>();

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

  void updateGameNickname(GameNickname gameNickname) {
    gameRepository.updateGameNickname(gameNickname);
  }

  void clear() {
    myGameList.clear();
  }
}

mixin class GameDataProvider {
  late final GameData gameData = Get.find<GameData>();
}
