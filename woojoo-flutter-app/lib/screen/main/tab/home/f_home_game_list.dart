import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/screen/main/tab/home/w_game_card.dart';
import 'package:woojoo/common/widget/w_subject_title.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/controller/my_games_controller.dart';
import '../../../../../data/remote/game/get_my_games.dart';
import '../../../../../common/widget/w_text2.dart';

class HomeGameListFrame extends StatefulWidget {
  const HomeGameListFrame({Key? key}) : super(key: key);

  @override
  State<HomeGameListFrame> createState() => _HomeGameListFrameState();
}

class _HomeGameListFrameState extends State<HomeGameListFrame> {
  late final String? _accessToken;
  List<dynamic> _userGameList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _initMyGameList();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyGamesController>(
      builder: (controller) {
        _userGameList = controller.games;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubjectTitle(title: "내 게임 목록"),
                InkWell(
                  splashColor: context.appColors.headerBackgroundColor,
                  onTap: () {
                    Get.toNamed('/setting/games?type=setting');
                  },
                  child: const SizedBox(
                    height: 20,
                    width: 40,
                    child: Text(
                      "편집",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 172, 172, 172),
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _userGameList.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.only(top: 5.0, left: 13),
                  height: 230.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _userGameList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GameCard(
                        gameName: _userGameList[index]['game'],
                        isMe: true,
                        nickname: _userGameList[index]['nickname'],
                      );
                    },
                  ),
                )
              : Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  height: 120.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.toNamed('/setting/games?type=setting');
                          },
                          child: const Text("게임등록",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ))),
                      const Text2(text: "을 해보세요!", size: 18),
                    ],
                  ),
                ),
        ]);
      },
    );
  }

  _initMyGameList() {
    print('_initMyGameList');
    _accessToken = Get.find<AccessTokenData>().accessToken;
    _getMyGameList();
  }

  _getMyGameList() {
    Future<dynamic> response = dioApiGetMyGames(_accessToken);
    response.then((res) {
      int statusCode = res["statusCode"];
      if (statusCode == 200) {
        Get.find<MyGamesController>().setMyGames(res['data']);
        setState(() {
          _userGameList = Get.find<MyGamesController>().games;
        });
      } else if (statusCode == 401) {
        notification(context, "다시 로그인 해주세요");
      }
    });
  }
}
