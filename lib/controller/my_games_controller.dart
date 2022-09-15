import 'package:get/get.dart';

class MyGamesController extends GetxController {
  List<dynamic> games = [];
  /*
  * games item structure
  *
  * {
  *   game: game name,
  *   nickname: game nickname
  * }
  */

  void setMyGames(List<dynamic> games) {
    this.games = games;
    update();
  }

  void clear(){
    games = [];
    update();
  }
}
