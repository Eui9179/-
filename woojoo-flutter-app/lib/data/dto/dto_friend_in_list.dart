import 'package:woojoo/data/dto/dto_user_simple.dart';

import 'dto_game.dart';

class UserInList {
  final UserSimple userSimple;
  final List<Game> gameList;
  bool? isFriend;

  UserInList({required this.userSimple, required this.gameList});

  factory UserInList.fromJson(Map<String, dynamic> json) {
    List<dynamic> games = json['games'];
    return UserInList(
      userSimple: UserSimple(
        id: json['id'],
        name: json['name'],
        profileImageName: json['profileImageName'],
      ),
      gameList: games.map((game) => Game(name: game.toString())).toList(),
    );
  }

  Map<String, dynamic> toJson() => {};
}
