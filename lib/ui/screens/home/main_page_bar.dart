import 'package:dor_app/ui/static_widget/woojoo_logo.dart';
import 'package:dor_app/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPageBar extends StatelessWidget implements PreferredSizeWidget {
  const MainPageBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: ColorPalette.headerBackgroundColor));
    return AppBar(
      backgroundColor: ColorPalette.headerBackgroundColor,
      elevation: 0.0,
      title: const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: WoojooLogo(),
      ),
      // actions: [
      //   IconButton(
      //     icon: const Icon(
      //         Icons.calendar_today_outlined),
      //     splashRadius: 25,
      //     tooltip: '오늘할 게임',
      //     onPressed: () {
      //       Get.toNamed('/todays-games');
      //     },
      //   ),
      //   IconButton(
      //     icon: const Icon(
      //       Icons.settings,
      //     ),
      //     splashRadius: 25,
      //     tooltip: '설정',
      //     onPressed: () {
      //       Get.toNamed('/setting');
      //     },
      //   ),
      //   const SizedBox(
      //     width: 7,
      //   )
      // ],
    );
  }
}
