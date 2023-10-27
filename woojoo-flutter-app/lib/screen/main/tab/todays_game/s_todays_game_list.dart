import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/w_text2.dart';
import 'package:woojoo/data/dto/dto_todays_game.dart';
import 'package:woojoo/data/memory/game/todays_game/todays_game_data.dart';
import 'package:woojoo/screen/main/tab/todays_game/w_todays_game_box.dart';
import 'package:woojoo/utils/notification.dart';

import '../../../../common/theme/font_size.dart';
import '../../../../dialog/selecting_todays_game/d_selecting_todays_game.dart';

class TodaysGameListScreen extends StatefulWidget {
  const TodaysGameListScreen({Key? key}) : super(key: key);

  @override
  State<TodaysGameListScreen> createState() => _TodaysGameListScreenState();
}

class _TodaysGameListScreenState extends State<TodaysGameListScreen>
    with TodaysGameDataProvider {
  bool onPressedRefresh = true;

  @override
  void initState() {
    super.initState();
    Get.put(TodaysGameData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.mainBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.appColors.headerBackgroundColor,
        title: const Text2(text: '오늘의 게임', size: 22),
        actions: [
          IconButton(
            onPressed: () => showSelectingTodaysGame(context),
            tooltip: "오늘의 게임 추가",
            splashRadius: 23,
            icon: Icon(
              Icons.add,
              color: context.appColors.sendButton,
              size: 30,
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          List<TodaysGame> todaysGameList = todaysGameData.todaysGameList;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: const EdgeInsets.only(left: 13, top: 10),
                  child: '친구들에게 오늘 무슨 게임을 할지 + 버튼을 눌러서 공유해 보세요!'
                      .text
                      .color(context.appColors.subText)
                      .size(FontSize.description)
                      .make(),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todaysGameList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(13),
                      child: TodaysGameBox(
                        index: index,
                        todaysGame: todaysGameList[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'refresh',
            onPressed: onPressedRefresh
                ? () {
                    _getMyGameList();
                    _disabledButton();
                  }
                : null,
            backgroundColor: onPressedRefresh
                ? Colors.blueAccent
                : context.appColors.boxFillColor,
            child: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
    );
  }

  _getMyGameList() {
    todaysGameData
        .getTodaysGameList()
        .then((value) => notification(context, '새로고침 완료', warning: false));
  }

  _disabledButton() {
    setState(() => onPressedRefresh = false);
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => onPressedRefresh = true);
      }
    });
  }
}
