import 'dart:async';

import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/main.dart';
import 'package:flutter/material.dart';

import '../../../../dialog/d_select_todays_game.dart';
import 'f_home_profile.dart';
import 'home_app_bar.dart';
import 'f_home_friend_list.dart';
import 'f_home_game_list.dart';
import 'f_home_group.dart';

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
    super.build(context);
    _getIsFirstAccess().then((result) {
      if (result) {
        Future.delayed(
            Duration.zero, () => showSelectTodaysGame(context, false));
      }
    });
    return Scaffold(
        backgroundColor: context.appColors.mainBackgroundColor,
        appBar: const MainPageBar(),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              HomeProfileFrame(),
              HomeGroupFrame(),
              HomeGameListFrame(),
              HomeFriendListFrame(),
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
