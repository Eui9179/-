import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/common/widget/w_height.dart';
import 'package:woojoo/common/widget/w_subject_title.dart';
import 'package:woojoo/data/memory/friend/friend_simple_data.dart';
import 'package:woojoo/data/memory/game/game_data.dart';
import 'package:woojoo/data/memory/game/game_setting/game_selection_data.dart';
import 'package:woojoo/screen/game_setting/w_game_selection_button.dart';

import '../../../utils/woojoo_games.dart';

List<String> gameList = getWoojooGameList();

class GameSettingScreen extends StatefulWidget {
  const GameSettingScreen({Key? key}) : super(key: key);

  @override
  State<GameSettingScreen> createState() => _GameSettingScreenState();
}

class _GameSettingScreenState extends State<GameSettingScreen>
    with GameSelectionDataProvider, FriendSimpleDataProvider {
  String type = Get.parameters['type']!;

  @override
  void initState() {
    Get.put(GameData());
    Get.put(GameSelectionData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gameSelectionList = gameSelectionData.gameSelectionList;
    return Scaffold(
        backgroundColor: context.appColors.mainBackgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: context.appColors.mainBackgroundColor,
          centerTitle: true,
          title: '게임 선택'
              .text
              .size(FontSize.title)
              .fontWeight(FontWeight.w400)
              .color(context.appColors.text)
              .make(),
          actions: [
            TextButton(
              onPressed: _onPressed,
              child:
                  '완료'.text.color(context.appColors.textButton).size(20).make(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubjectTitle(
                "프로필에 보여질 게임을 선택해 주세요! 추가하고 싶은 게임이 있다면 설정에 고객센터를 이용해주세요.",
              ),
              height15,
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 2 / 1.1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: gameSelectionList
                    .map((game) => GameSelectionButton(
                          gameSelection: game,
                          onTap: () {
                            setState(() => game.toggle());
                          },
                        ))
                    .toList(),
              ),
            ],
          ).p(10),
        ));
  }

  _onPressed() {
    gameSelectionData.submitSelectedGameList();
    if (type == 'signup') Get.offAllNamed('/');
    friendSimpleData.getMyFriendList(); // TODO 중복된 게임 계산
    Get.back();
  }
}
