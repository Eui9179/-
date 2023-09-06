import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';

class SendIconButton extends StatelessWidget {
  const SendIconButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: "게임하자",
      splashRadius: 23,
      icon: Icon(
        Icons.telegram,
        color: context.appColors.sendButton,
        size: 35,
      ),
    );
  }
}
