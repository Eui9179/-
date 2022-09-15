import 'package:get/get.dart';

class TodaysGameController extends GetxController {
  List<dynamic> todaysGameList = [];

  setTodaysGameList(List<dynamic> tg) {
    todaysGameList = tg;
    update();
  }

  insertTodayGame(Map<String, dynamic> todaysGame) {
    todaysGameList.add(todaysGame);
    update();
  }
}
