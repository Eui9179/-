import 'package:flutter/material.dart';
import 'package:woojoo/common/widget/avatar/w_avatar.dart';
import 'package:woojoo/common/widget/w_height.dart';

import '../../../ui/dynamic_widget/font/subject_title.dart';
import '../../constants.dart';
import '../w_width.dart';

class GameBadge extends StatelessWidget {
  final int size;
  final List<dynamic> gameNames;

  const GameBadge({
    super.key,
    required this.size,
    required this.gameNames,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMarginBySize(size),
        getGameBadgeBySize(size, gameNames),
      ],
    );
  }

  Widget getMarginBySize(int size) {
    switch (size) {
      case 0:
        return const SizedBox();
      default:
        return height5;
    }
  }

  Widget getGameBadgeBySize(int size, List<dynamic> gameNames) {
    switch (size) {
      case 0:
        return const SizedBox();
      case 1:
        return Row(
          children: [
            Avatar(
              imagePath: '$gamePath/logo/${gameNames[0]}_logo.png',
              radius: Avatar.gameAvatarSize,
              isAssert: true,
            ),
            width5,
            const SubjectTitle(title: "함께 하는 게임 1개"),
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
                    imagePath: '$gamePath/logo/${gameNames[1]}_logo.png',
                    radius: Avatar.gameAvatarSize,
                    isAssert: true,
                  ),
                ),
                Avatar(
                  imagePath: '$gamePath/logo/${gameNames[0]}_logo.png',
                  radius: Avatar.gameAvatarSize,
                  isAssert: true,
                ),
              ],
            ),
            width5,
            SubjectTitle(title: "함께 하는 게임 $size개")
          ],
        );
    }
  }
}
