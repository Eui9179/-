import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/friend/friend_simple_data.dart';
import 'package:woojoo/data/memory/game/game_data.dart';

import '../../../../common/prefs/first_connection.dart';
import '../../../../data/memory/group/group_data.dart';
import '../../../../data/memory/user/user_simple_data.dart';
import '../../../../dialog/selecting_todays_game/d_selecting_todays_game.dart';
import 'f_home_friend_list.dart';
import 'f_home_game_list.dart';
import 'f_home_group.dart';
import 'f_home_profile.dart';
import 'home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    FirstConnection.runIfFirst(
      () => Future.delayed(
        Duration.zero,
        () => showSelectingTodaysGame(context),
      ),
    );

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
      ),
    );
  }
}
