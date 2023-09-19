import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';

class TextAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TextAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: context.appColors.mainBackgroundColor,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: context.appColors.text),
      ),
      centerTitle: true,
    );
  }
}
