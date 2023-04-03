import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/controller/my_games_controller.dart';
import 'package:woojoo/dio/friend/get_my_friends.dart';
import 'package:woojoo/dio/game/update_my_games.dart';
import 'package:woojoo/ui/dynamic_widget/font/subject_title.dart';
import 'package:woojoo/utils/color_palette.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/my_friends_controller.dart';
import '../../../utils/woojoo_games.dart';

List<String> gameList = getWoojooGameList();

class SelectGames extends StatefulWidget {
  const SelectGames({Key? key}) : super(key: key);

  @override
  State<SelectGames> createState() => _SelectGameState();
}

class _SelectGameState extends State<SelectGames> {
  List<Map> _gameList = [];
  List<dynamic> _myGames = [];
  String type = Get.parameters['type']!;

  @override
  void initState() {
    super.initState();
    _initMyGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.mainBackgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ColorPalette.mainBackgroundColor,
          title: const Text(
            "게임 선택",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: ColorPalette.font),
          ),
          actions: [
            TextButton(
                onPressed: _onPressed,
                child: const Text(
                  '완료',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                )),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubjectTitle(
                    title:
                        "프로필에 보여질 게임을 선택해 주세요! \n추가하고 싶은 게임이 있다면 설정에 고객센터를 이용해주세요."),
                const SizedBox(
                  height: 15,
                ),
                GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 1.1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: List.generate(_gameList.length, (index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _gameList[index]['isSelected'] =
                                  !_gameList[index]['isSelected'];
                            });
                          },
                          child: Stack(children: [
                            ColorFiltered(
                              colorFilter: _gameList[index]['isSelected']
                                  ? ColorFilter.mode(
                                      const Color.fromARGB(255, 29, 60, 135)
                                          .withOpacity(0.7),
                                      BlendMode.srcOver)
                                  : ColorFilter.mode(
                                      Colors.black87.withOpacity(0.4),
                                      BlendMode.srcOver),
                              child: Image.asset(
                                "assets/images/game/${_gameList[index]["gameName"]}.jpg",
                                fit: BoxFit.cover,
                                height: 110,
                                width: 200,
                              ),
                            ),
                            Positioned(
                              bottom: 4,
                              left: 4,
                              child: Text(
                                changeKorGameName(_gameList[index]["gameName"]),
                                // .jpg, .png 제외
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            _gameList[index]['isSelected']
                                ? const Positioned(
                                    top: 4,
                                    right: 4,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  )
                                : const SizedBox(),
                          ]),
                        ),
                      );
                    })),
              ],
            ),
          ),
        ));
  }

  _onPressed() {
    String accessToken = Get.find<AccessTokenController>().accessToken;
    Future<Map<String, dynamic>> response =
        dioApiUpdateMyGames(accessToken, filterSelectedGameList());
    response.then((res) {
      int statusCode = res["statusCode"];
      if (statusCode == 200) {
        if (type == 'signup') {
          Get.offAllNamed('/');
        } else if (type == 'setting') {
          Get.find<MyGamesController>().setMyGames(res['data']);
          Future<Map<String, dynamic>> response =
              dioApiGetMyFriends(accessToken);
          response.then((res) {
            if (statusCode == 200) {
              Get.find<MyFriendsController>().setMyFriends(res['data']);
            } else if (statusCode == 401) {
              notification(context, '다시 로그인 해주세요');
            } else {
              print('_getMyFriendList() error: $statusCode');
            }
          });
          Get.back();
        }
      } else {
        print("step3Game _onPressed() error: $statusCode");
      }
    });
  }

  List<String> filterSelectedGameList() {
    List<String> selectedGameList = [];
    for (var element in _gameList) {
      if (element["isSelected"]) {
        selectedGameList.add(element["gameName"]);
        print(element["gameName"]);
      }
    }
    return selectedGameList;
  }

  _initMyGames() {
    _myGames = Get.find<MyGamesController>().games;
    List<String> myGames =
        List.generate(_myGames.length, (index) => _myGames[index]['game']);
    _gameList = List.generate(gameList.length, (index) {
      if (myGames.contains(gameList[index])) {
        return {'gameName': gameList[index], 'isSelected': true};
      }
      return {'gameName': gameList[index], 'isSelected': false};
    });
  }
}
