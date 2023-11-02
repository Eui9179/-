import 'package:flutter/material.dart';
import 'package:woojoo/common/widget/avatar/w_avatar.dart';
import 'package:woojoo/common/widget/w_height.dart';
import 'package:woojoo/data/dto/dto_game.dart';

import 'w_subject_title.dart';
import '../constants.dart';
import 'w_width.dart';

class GameBadge extends StatelessWidget {
  final List<Game> gameList;

  const GameBadge({
    super.key,
    required this.gameList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMarginBySize(),
        getGameBadgeBySize(gameList),
      ],
    );
  }

  Widget getMarginBySize() {
    if (gameList.isEmpty) return const SizedBox();
    return height5;
  }

  Widget getGameBadgeBySize(List<Game> gameNames) {
    switch (gameNames.length) {
      case 0:
        return const SizedBox();
      case 1:
        return Row(
          children: [
            Avatar(
              imagePath: '$gamePath/logo/${gameNames[0].name}_logo.png',
              radius: Avatar.gameAvatarSize,
              isAssert: true,
            ),
            width10,
            const SubjectTitle("함께 하는 게임 1개"),
          ],
        );
      default:
        return Row(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Avatar(
                    imagePath: '$gamePath/logo/${gameNames[1].name}_logo.png',
                    radius: Avatar.gameAvatarSize,
                    isAssert: true,
                  ),
                ),
                Avatar(
                  imagePath: '$gamePath/logo/${gameNames[0].name}_logo.png',
                  radius: Avatar.gameAvatarSize,
                  isAssert: true,
                ),
              ],
            ),
            width10,
            SubjectTitle("함께 하는 게임 ${gameList.length}개")
          ],
        );
    }
  }
}
