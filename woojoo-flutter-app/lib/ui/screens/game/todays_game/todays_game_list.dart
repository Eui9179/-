import 'dart:async';

import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/controller/todays_game_controller.dart';
import 'package:woojoo/ui/dynamic_widget/avatar/profile_avatar.dart';
import 'package:woojoo/ui/dynamic_widget/font/font.dart';
import 'package:woojoo/utils/woojoo_games.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../remote/game/delete_todays_game.dart';
import '../../../../remote/todays_games/get_todays_games.dart';
import 'select_todays_game.dart';

class TodaysGameList extends StatefulWidget {
  const TodaysGameList({Key? key}) : super(key: key);

  @override
  State<TodaysGameList> createState() => _TodaysGameListState();
}

class _TodaysGameListState extends State<TodaysGameList> {
  List<dynamic> todaysGameList = [];
  bool onPressedRefresh = true;
  Offset _tapPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _getMyGameList(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.mainBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.appColors.headerBackgroundColor,
        title: const Font(text: '오늘의 게임', size: 22),
        actions: [
          IconButton(
            onPressed: () {
              showSelectTodaysGame(context, true);
            },
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
      body: GetBuilder<TodaysGameController>(
        builder: (controller) {
          todaysGameList = controller.todaysGameList;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsets.only(left: 13, top: 10),
                    child: Text('친구들에게 오늘 무슨 게임을 할지 + 버튼을 눌러서 공유해 보세요!',
                        style: TextStyle(
                            color: context.appColors.subFont, fontSize: 13))),
                ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: todaysGameList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 13, right: 13, top: 13, bottom: 7),
                        child: _todaysGameSection(
                            index,
                            todaysGameList[index]['id'],
                            todaysGameList[index]['todays_game_id'],
                            todaysGameList[index]['profile_image_name'],
                            todaysGameList[index]['name'],
                            todaysGameList[index]['create_time'],
                            todaysGameList[index]['game'],
                            todaysGameList[index]['game_nickname'],
                            todaysGameList[index]['introduction'],
                            todaysGameList[index]['isme']),
                      );
                    }),
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
                    _getMyGameList(true);
                    _disabledButton();
                  }
                : null,
            backgroundColor: onPressedRefresh
                ? Colors.blueAccent
                : context.appColors.boxFillColor,
            child: const Icon(Icons.refresh_outlined),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () {
              showSelectTodaysGame(context, true);
            },
            backgroundColor: Colors.blueAccent,
            child: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  _getMyGameList(bool isRefresh) {
    String accessToken = Get.find<AccessTokenController>().accessToken;
    Future<dynamic> response = dioApiGetTodaysGames(accessToken);
    response.then((res) {
      int statusCode = res["statusCode"];
      if (statusCode == 200) {
        Get.find<TodaysGameController>().setTodaysGameList(res['data']);
        if (isRefresh) {
          notification(context, '새로고침 완료', warning: false);
        }
      } else {
        print(statusCode);
      }
    });
  }

  Widget _todaysGameSection(
      int todaysGameListIndex,
      int userId,
      int todaysGameId,
      String profileImageName,
      String userName,
      String createTime,
      String game,
      String? gameNickname,
      String introduction,
      bool isMe) {
    if (isMe) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              onTapDown: (details) => _getTapPosition(details),
              onLongPress: () =>
                  _showContextMenu(context, todaysGameId, todaysGameListIndex),
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: context.appColors.boxFillColor,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                              color: context.appColors.font,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          _getTime(createTime),
                          style: TextStyle(
                              color: context.appColors.subFont, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "assets/images/game/logo/${game}_logo.png")),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          changeKorGameName(game),
                          style: TextStyle(
                              color: context.appColors.font, fontSize: 17),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        gameNickname != null
                            ? Text(
                                gameNickname,
                                style: TextStyle(
                                    color: context.appColors.subFont, fontSize: 15),
                              )
                            : const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    introduction != ''
                        ? const SizedBox(
                            height: 6,
                          )
                        : const SizedBox(),
                    introduction != ''
                        ? Text(
                            introduction,
                            style: TextStyle(
                                color: context.appColors.subFont, fontSize: 17),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          ProfileAvatar(
            image: profileImageName,
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
            onTap: () => Get.toNamed('/users/$userId'),
            child: ProfileAvatar(
              image: profileImageName,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: context.appColors.boxFillColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed('/users/$userId'),
                        child: Text(
                          userName,
                          style: TextStyle(
                              color: context.appColors.font,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Text(
                        _getTime(createTime),
                        style: TextStyle(
                            color: context.appColors.subFont, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                              "assets/images/game/logo/${game}_logo.png")),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        changeKorGameName(game),
                        style: TextStyle(
                            color: context.appColors.font, fontSize: 17),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      gameNickname != null
                          ? Text(
                              gameNickname,
                              style: TextStyle(
                                  color: context.appColors.subFont, fontSize: 15),
                            )
                          : const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  introduction != ''
                      ? const SizedBox(
                          height: 6,
                        )
                      : const SizedBox(),
                  introduction != ''
                      ? Text(
                          introduction,
                          style: TextStyle(
                              color: context.appColors.subFont, fontSize: 17),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  _disabledButton() {
    setState(() {
      onPressedRefresh = false;
    });
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          onPressedRefresh = true;
        });
      }
    });
  }

  _getTime(String time) {
    return time.split('T')[1].substring(0, 5);
  }

  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  void _showContextMenu(
      BuildContext context, int todaysGameId, int todaysGameListIndex) async {
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
                overlay.paintBounds.size.height)),
        items: [
          PopupMenuItem(
            height: 27,
            value: 'delete',
            child: Text(
              '삭제하기',
              style: TextStyle(color: context.appColors.font),
            ),
          ),
        ]);
    switch (result) {
      case 'delete':
        _deleteTodaysGameApi(todaysGameId, todaysGameListIndex);
        break;
    }
  }

  _deleteTodaysGameApi(int todaysGameId, int todaysGameListIndex) {
    String accessToken = Get.find<AccessTokenController>().accessToken;
    Future<dynamic> response =
        dioApiDeleteTodaysGame(accessToken, todaysGameId);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        todaysGameList.removeAt(todaysGameListIndex);
        Get.find<TodaysGameController>().setTodaysGameList([...todaysGameList]);
      } else {
        print(statusCode);
      }
    });
  }
}
