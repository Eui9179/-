import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/ui/static_widget/woojoo_logo.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.appColors.mainBackgroundColor,
      elevation: 0.0,
      centerTitle: true,
      title: const WoojooLogo(),
    );
  }
}
