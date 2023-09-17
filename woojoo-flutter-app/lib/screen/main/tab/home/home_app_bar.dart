import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/logo/w_logo.dart';

class MainPageBar extends StatelessWidget implements PreferredSizeWidget {
  const MainPageBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: context.appColors.headerBackgroundColor));
    return AppBar(
      backgroundColor: context.appColors.headerBackgroundColor,
      elevation: 0.0,
      title: const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Logo(),
      ),
    );
  }
}
