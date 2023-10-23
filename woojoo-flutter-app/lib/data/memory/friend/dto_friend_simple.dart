import '../game/dto_game.dart';
import '../user/dto_user_simple.dart';

class FriendSimple {
  final UserSimple userSimple;
  final List<Game> gameList;

  FriendSimple({required this.userSimple, required this.gameList});

  factory FriendSimple.fromJson(Map<String, dynamic> json) {
    List<dynamic> games = json['games'];
    return FriendSimple(
      userSimple: UserSimple(
        id: json['id'],
        name: json['name'],
        profileImageName: json['profileImageName'],
      ),
      gameList: games.map((game) => Game(name: game.toString())).toList(),
    );
  }
}
