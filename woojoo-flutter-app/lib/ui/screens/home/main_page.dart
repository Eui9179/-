import 'dart:async';

import 'package:woojoo/main.dart';
import 'package:woojoo/ui/screens/home/main_page_bar.dart';
import 'package:woojoo/ui/screens/game/todays_game/select_todays_game.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_palette.dart';
import 'my_friends.dart';
import 'my_games.dart';
import 'my_groups.dart';
import 'my_profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getIsFirstAccess();
  }

  @override
  Widget build(BuildContext context) {
    _getIsFirstAccess().then((result) {
      if (result) {
        Future.delayed(
            Duration.zero, () => showSelectTodaysGame(context, false));
      }
    });
    return Scaffold(
        backgroundColor: ColorPalette.mainBackgroundColor,
        appBar: const MainPageBar(),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              MyProfile(),
              MyGroups(),
              MyGames(),
              MyFriends(),
            ],
          ),
        ));
  }

  Future<bool> _getIsFirstAccess() async {
    // 저장된 최근 날짜와 접속 날짜가 다르면 최초 접속
    String? lastAccessTime = await storage.read(key: "lastAccessTime");
    DateTime now = DateTime.now();
    String today = now.toString().split(' ')[0];

    if (today == lastAccessTime) {
      return false;
    } else {
      storage.write(key: 'lastAccessTime', value: today);
      return true;
    }
  }
}
