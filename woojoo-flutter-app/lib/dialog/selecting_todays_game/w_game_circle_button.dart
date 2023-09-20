import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';

class GameCircleButton extends StatefulWidget {
  final VoidCallback onTap;
  final String gameName;
  final bool isSelect;

  const GameCircleButton(
      {super.key,
      required this.onTap,
      required this.gameName,
      required this.isSelect});

  @override
  State<GameCircleButton> createState() => _GameCircleButtonState();
}

class _GameCircleButtonState extends State<GameCircleButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ColorFiltered(
          colorFilter: widget.isSelect
              ? ColorFilter.mode(
                  context.appColors.gameSelectedColor,
                  BlendMode.srcOver,
                )
              : ColorFilter.mode(
                  context.appColors.gameUnSelectedColor,
                  BlendMode.srcOver,
                ),
          child: Image.asset(
            "assets/images/game/logo/${widget.gameName}_logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}
