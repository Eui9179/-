import 'package:get/get.dart';
import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/data/dto/dto_todays_game_request.dart';
import 'package:woojoo/data/remote/api/game/todays_game/todays_game_repository.dart';
import '../../../dto/dto_todays_game.dart';

class TodaysGameData extends GetxController {
  RxList<TodaysGame> todaysGameList = <TodaysGame>[].obs;
  final todaysGameRepository = getIt.get<TodaysGameRepository>();

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
    await todaysGameRepository.insertTodaysGames(request);
    getTodaysGameList();
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