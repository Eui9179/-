import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/common/widget/w_subject_title.dart';
import 'package:woojoo/data/memory/game/game_data.dart';
import 'package:woojoo/screen/main/tab/home/w_game_card.dart';

class HomeGameListFrame extends StatefulWidget {
  const HomeGameListFrame({Key? key}) : super(key: key);

  @override
  State<HomeGameListFrame> createState() => _HomeGameListFrameState();
}

class _HomeGameListFrameState extends State<HomeGameListFrame>
    with GameDataProvider {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SubjectTitle(title: "내 게임 목록"),
            InkWell(
              splashColor: context.appColors.headerBackgroundColor,
              onTap: () {
                Get.toNamed('/setting/games?type=setting');
              },
              child: "편집"
                  .text
                  .underline
                  .align(TextAlign.center)
                  .color(context.appColors.subText)
                  .size(FontSize.subTitle)
                  .make(),
            ),
          ],
        ).pSymmetric(h: 13),
        gameData.myGameList.isNotEmpty
            ? Container(
                margin: const EdgeInsets.only(top: 5.0, left: 13),
                height: 230.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: gameData.myGameList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GameCard(
                      gameName: gameData.myGameList[index].game,
                      isMe: true,
                      nickname: gameData.myGameList[index].nickname,
                    );
                  },
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                height: 200.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/setting/games?type=setting');
                      },
                      child: '게임등록'
                          .text
                          .size(FontSize.normal)
                          .color(context.appColors.textButton)
                          .underline
                          .make(),
                    ),
                    '을 해보세요!'.text.color(context.appColors.text).size(FontSize.normal).make(),
                  ],
                ),
              ),
      ]),
    );
  }
}
