import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/w_width.dart';
import 'package:woojoo/data/memory/game/todays_game/todays_game_data.dart';

import '../../../../common/theme/font_size.dart';
import '../../../../common/widget/avatar/w_profile_avatar.dart';
import '../../../../common/widget/w_height.dart';
import '../../../../data/memory/game/todays_game/dto_todays_game.dart';
import '../../../../utils/woojoo_games.dart';

class TodaysGameBox extends StatefulWidget {
  final int index;
  final TodaysGame todaysGame;

  const TodaysGameBox(
      {super.key, required this.index, required this.todaysGame});

  @override
  State<TodaysGameBox> createState() => _TodaysGameBoxState();
}

class _TodaysGameBoxState extends State<TodaysGameBox>
    with TodaysGameDataProvider {
  Offset _tapPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    TodaysGame todaysGame = widget.todaysGame;
    if (todaysGame.isMe != null && todaysGame.isMe!) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              onTapDown: (details) => _getTapPosition(details),
              onLongPress: () => _showContextMenu(
                context,
                todaysGame.id,
                widget.index,
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.appColors.boxFillColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          todaysGame.userName,
                          style: TextStyle(
                            color: context.appColors.text,
                            fontSize: FontSize.subTitle,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          todaysGameData.resolveTime(todaysGame.createdTime),
                          style: TextStyle(
                            color: context.appColors.subText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    height5,
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            "assets/images/game/logo/${todaysGame.gameName}_logo.png",
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          changeKorGameName(todaysGame.gameName),
                          style: TextStyle(
                              color: context.appColors.text,
                              fontSize: FontSize.subTitle),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        todaysGame.gameNickname != null
                            ? Text(
                                todaysGame.gameNickname!,
                                style: TextStyle(
                                    color: context.appColors.subText,
                                    fontSize: 15),
                              )
                            : const SizedBox()
                      ],
                    ),
                    todaysGame.description != null
                        ? Text(todaysGame.description ?? '',
                                style: TextStyle(
                                    color: context.appColors.text,
                                    fontSize: 17))
                            .pOnly(bottom: 5, top: 10)
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          const Width(7),
          ProfileAvatar(
            image: todaysGame.profileImageName,
            size: 20,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Get.toNamed('/users/${todaysGame.userId}'),
            child: ProfileAvatar(
              image: todaysGame.profileImageName,
              size: 20,
            ),
          ),
          const Width(7),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.appColors.boxFillColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed('/users/${todaysGame.userId}'),
                        child: Text(
                          todaysGame.userName,
                          style: TextStyle(
                              color: context.appColors.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Text(
                        todaysGameData.resolveTime(todaysGame.createdTime),
                        style: TextStyle(
                            color: context.appColors.subText, fontSize: 12),
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                          "assets/images/game/logo/${todaysGame.gameName}_logo.png",
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        changeKorGameName(todaysGame.gameName),
                        style: TextStyle(
                            color: context.appColors.text, fontSize: 17),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      todaysGame.gameNickname != null
                          ? Text(
                              todaysGame.gameNickname!,
                              style: TextStyle(
                                  color: context.appColors.subText,
                                  fontSize: 15),
                            )
                          : const SizedBox()
                    ],
                  ),
                  todaysGame.description != null
                      ? Text(todaysGame.description ?? '',
                              style: TextStyle(
                                  color: context.appColors.text, fontSize: 17))
                          .pOnly(bottom: 5, top: 10)
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    _tapPosition = referenceBox.globalToLocal(details.globalPosition);
  }

  void _showContextMenu(BuildContext context, int id, int index) async {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();
    final result = await showMenu(
        color: context.appColors.mainBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        context: context,
        position: RelativeRect.fromRect(
          Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
          Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
              overlay.paintBounds.size.height),
        ),
        items: [
          PopupMenuItem(
            height: 27,
            value: 'delete',
            child: Text(
              '삭제하기',
              style: TextStyle(color: context.appColors.text),
            ),
          ),
        ]);
    switch (result) {
      case 'delete':
        todaysGameData.deleteTodaysGame(id, index);
        break;
    }
  }
}
