import 'package:flutter/material.dart';
import 'package:woojoo/data/dto/dto_game.dart';
import 'package:woojoo/screen/main/tab/home/w_game_card.dart';

class GameListWidget extends StatelessWidget {
  final List<Game> gameList;

  const GameListWidget(this.gameList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0, left: 13),
      height: 230.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: gameList.length,
        itemBuilder: (BuildContext context, int index) {
          return GameCard(
            gameName: gameList[index].name,
            isMe: true,
            nickname: gameList[index].nickname,
          );
        },
      ),
    );
  }
}
