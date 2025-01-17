import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/w_game_badge.dart';
import 'package:woojoo/utils/woojoo_games.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/avatar/w_user_avatar.dart';
import '../../../../../common/widget/w_subject_title.dart';
import '../../../../../common/widget/w_text2.dart';
import '../../../../../data/controller/my_friends_controller.dart';

class GameFriendListScreen extends StatefulWidget {
  const GameFriendListScreen({Key? key}) : super(key: key);

  @override
  State<GameFriendListScreen> createState() => _GameFriendListScreenState();
}

class _GameFriendListScreenState extends State<GameFriendListScreen> {
  final List<dynamic> _friends = [];
  final String gameName = Get.parameters["gameName"]!;

  @override
  void initState() {
    super.initState();
    List<dynamic> friends = Get.find<MyFriendsController>().myFriends;
    for (var friend in friends) {
      if (friend['games'].contains(gameName)) {
        _friends.add(friend);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.mainBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0.0,
          titleSpacing: 0,
          backgroundColor: context.appColors.headerBackgroundColor,
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: AssetImage(
                        'assets/images/game/logo/${gameName}_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                changeKorGameName(gameName),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          // flexibleSpace: Image(
          //   image: AssetImage('assets/images/game/logo/${gameName}_logo.png'),
          //   fit: BoxFit.cover,
          // )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 13, right: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SubjectTitle('내 게임 친구'),
                  SubjectTitle('${_friends.length.toString()} 명'),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemExtent: 75.0,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _friends.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/users/${_friends[index]['id']}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 13.0, left: 13.0),
                      child: Row(
                        children: [
                          UserAvatar(
                            imagePath: _friends[index]["profile_image_name"],
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            flex: 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text2(
                                      text: _friends[index]["name"],
                                      size: 18,
                                    ),
                                    GameBadge(
                                      gameList: _friends[index]['games'],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
