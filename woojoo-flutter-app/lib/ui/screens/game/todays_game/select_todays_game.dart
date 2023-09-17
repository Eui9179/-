import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/controller/my_games_controller.dart';
import 'package:woojoo/controller/todays_game_controller.dart';

import '../../../../data/remote/game/insert_todays_game.dart';
import '../../../../data/remote/todays_games/get_todays_games.dart';

Future<String?> showSelectTodaysGame(
    BuildContext context, bool isUpdate) async {
  List<dynamic> myGames = Get.find<MyGamesController>().games;
  List<dynamic> selectableGames = List.generate(myGames.length,
      (index) => {'gameName': myGames[index]['game'], 'isSelected': false});
  int lastSelectedIndex = -1;
  String? introduction;
  final formKey = GlobalKey<FormState>();

  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            backgroundColor: context.appColors.mainBackgroundColor,
            contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            actionsAlignment: MainAxisAlignment.spaceAround,
            title: SizedBox(
              height: 90,
              child: Column(
                children: [
                  Text(
                    '오늘 할 게임 선택',
                    style:
                        TextStyle(color: context.appColors.font, fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '오늘 무슨 게임을 할건지 선택해 주세요.',
                    style: TextStyle(
                        color: context.appColors.subFont, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '친구들에게 공유됩니다.',
                    style: TextStyle(
                        color: context.appColors.subFont, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            content: SizedBox(
              width: 130,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1,
                        children:
                            List.generate(selectableGames.length, (index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (lastSelectedIndex > -1 &&
                                      lastSelectedIndex != index) {
                                    selectableGames[lastSelectedIndex]
                                        ['isSelected'] = false;
                                  }
                                  selectableGames[index]['isSelected'] =
                                      !selectableGames[index]['isSelected'];
                                  if (selectableGames[index]['isSelected']) {
                                    lastSelectedIndex = index;
                                  } else {
                                    lastSelectedIndex = -1;
                                  }
                                });
                              },
                              child: ColorFiltered(
                                colorFilter: selectableGames[index]
                                        ['isSelected']
                                    ? ColorFilter.mode(
                                        const Color.fromARGB(255, 67, 107, 197)
                                            .withOpacity(0.8),
                                        BlendMode.srcOver)
                                    : ColorFilter.mode(
                                        Colors.black87.withOpacity(0.2),
                                        BlendMode.srcOver),
                                child: Image.asset(
                                  "assets/images/game/logo/${selectableGames[index]["gameName"]}_logo.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLength: 50,
                      maxLines: 3,
                      minLines: 3,
                      onChanged: (val) {
                        introduction = val;
                      },
                      validator: (val) {
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 17.0, color: context.appColors.font),
                      decoration: InputDecoration(
                        counterStyle:
                            TextStyle(color: context.appColors.subFont),
                        fillColor: const Color.fromARGB(255, 62, 62, 75),
                        filled: true,
                        labelText: '메모',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 206, 206, 215),
                            fontSize: 17),
                        alignLabelWithHint: true,
                        // label align
                        hintText: '저녁 7시에 게임할 사람!',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 206, 206, 215),
                            fontSize: 16),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 52, 52, 71),
                                width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.blueAccent, width: 2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    '닫기',
                    style:
                        TextStyle(color: context.appColors.font, fontSize: 20),
                  )),
              TextButton(
                  onPressed: () {
                    if (lastSelectedIndex < 0) {
                      Get.back();
                    } else {
                      _onPressed(selectableGames[lastSelectedIndex]["gameName"],
                          introduction ?? '', isUpdate);
                    }
                  },
                  child: const Text(
                    '완료',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                  )),
            ],
          );
        });
      });
}

_onPressed(String game, String introduction, bool isUpdate) {
  String accessToken = Get.find<AccessTokenData>().accessToken;
  Future<Map<String, dynamic>> response =
      dioApiInsertTodaysGame(accessToken, game, introduction);
  response.then((res) {
    int statusCode = res["statusCode"];
    if (statusCode == 200) {
      if (isUpdate) {
        getMyTodaysGameList();
      }
      Get.back();
    } else {
      print(statusCode);
    }
  });
}

getMyTodaysGameList() {
  String accessToken = Get.find<AccessTokenData>().accessToken;
  Future<dynamic> response = dioApiGetTodaysGames(accessToken);
  response.then((res) {
    int statusCode = res["statusCode"];
    if (statusCode == 200) {
      Get.find<TodaysGameController>().setTodaysGameList(res['data']);
    } else {
      print(statusCode);
    }
  });
}
