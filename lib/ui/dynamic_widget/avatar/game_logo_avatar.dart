import 'package:dor_app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class GameLogoAvatar extends StatelessWidget {
  const GameLogoAvatar({Key? key, required this.gameName}) : super(key: key);
  final String gameName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorPalette.mainBackgroundColor,
      radius: 13,
      child: CircleAvatar(
        backgroundColor: ColorPalette.headerBackgroundColor,
        backgroundImage:
            AssetImage("assets/images/game/logo/${gameName}_logo.png"),
        radius: 10.0,
      ),
    );
  }
}
