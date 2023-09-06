import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';

class MoreIconButton extends StatelessWidget {
  const MoreIconButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashRadius: 20,
      tooltip: "더보기",
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Icon(Icons.more_vert, color: context.appColors.font, size: 20),
    );
  }
}
