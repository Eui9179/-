import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/constants.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';

import '../../data/memory/game/game_setting/vo_game_selection.dart';
import '../../utils/woojoo_games.dart';

class GameSelectionButton extends StatelessWidget {
  final GameSelection gameSelection;
  final VoidCallback onTap;

  const GameSelectionButton({
    super.key,
    required this.gameSelection,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(children: [
          ColorFiltered(
            colorFilter: colorMode(context, gameSelection.isSelected),
            child: Image.asset(
              "$gamePath/${gameSelection.name}.jpg",
              fit: BoxFit.cover,
              height: 110,
              width: 200,
            ),
          ),
          Positioned(
            bottom: 4,
            left: 4,
            child: changeKorGameName(gameSelection.name)
                .text
                .color(context.appColors.text)
                .bold
                .size(FontSize.subTitle)
                .make(),
          ),
          gameSelection.isSelected
              ? Positioned(
                  top: 4,
                  right: 4,
                  child: Icon(
                    Icons.check,
                    color: context.appColors.text,
                  ),
                )
              : const SizedBox(),
        ]),
      ),
    );
  }

  colorMode(BuildContext context, bool isSelected) {
    Color filterColor = isSelected
        ? context.appColors.gameSelectedColor
        : context.appColors.gameUnSelectedColor;
    return ColorFilter.mode(filterColor, BlendMode.srcOver);
  }
}
