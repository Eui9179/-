import 'package:woojoo/common/context_extension.dart';
import 'package:flutter/material.dart';

class GameLogoAvatar extends StatelessWidget {
  const GameLogoAvatar({Key? key, required this.gameName}) : super(key: key);
  final String gameName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.appColors.transparent,
      radius: 10,
      foregroundImage: AssetImage("assets/images/game/logo/${gameName}_logo.png"),
    );
  }
}
