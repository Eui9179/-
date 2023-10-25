import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/avatar/w_group_avatar.dart';
import 'package:woojoo/common/widget/button/w_text_button2.dart';
import 'package:woojoo/data/memory/friend/friend_simple_data.dart';
import 'package:woojoo/data/memory/game/dto_game.dart';
import 'package:woojoo/utils/notification.dart';

import '../../../../../../common/widget/avatar/w_user_avatar.dart';
import '../../../../../../common/widget/w_game_badge.dart';
import '../../../../../../common/widget/w_subject_title.dart';
import '../../../../../../common/widget/w_text2.dart';
import '../../../../../../data/remote/group/get_friends_by_group_detail1.dart';

class GroupDetailScreen extends StatefulWidget {
  const GroupDetailScreen({Key? key}) : super(key: key);

  @override
  State<GroupDetailScreen> createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen>
    with FriendSimpleDataProvider {
  List<dynamic> _people = [];
  List<dynamic> _friends = [];

  @override
  void initState() {
    super.initState();
    _initMyGroupDetail();
  }

  final String groupName = Get.parameters["name"]!;
  final String detail1 = Get.parameters["detail1"]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.mainBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.appColors.headerBackgroundColor,
        title: Text(
          "학교 게임 친구",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: context.appColors.text),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 13.0, left: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          child: GroupAvatar(image: groupName)),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text2(
                                text: '$groupName $detail1학년',
                                size: 23,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SubjectTitle(
                                '${_people.length + _friends.length}명이 소속되어 있습니다.',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton2(
                    onPressed: () {
                      Get.toNamed("/group/detail?name=$groupName");
                    },
                    text: '전체 보기',
                    color: Colors.blueAccent,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 13.0, left: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$groupName 친구들',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 172, 172, 172),
                          fontSize: 18)),
                  Row(
                    children: [
                      SubjectTitle('${_friends.length.toString()} 명'),
                      const SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
                              imagePath: _friends[index]["profile_image_name"]),
                          const SizedBox(
                            width: 13,
                          ),
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
                                      size: _friends[index]['games'].length,
                                      gameList: (_friends[index]['games']
                                              as List<dynamic>)
                                          .map((e) => Game(name: e.toString()))
                                          .toList(),
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
            Padding(
              padding: const EdgeInsets.only(right: 13.0, left: 13.0, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('알 수도 있는 친구들',
                      style: TextStyle(
                          color: Color.fromARGB(255, 172, 172, 172),
                          fontSize: 18)),
                  Row(
                    children: [
                      SubjectTitle('${_people.length.toString()} 명'),
                      const SizedBox(width: 10),
                    ],
                  )
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
                itemCount: _people.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/users/${_people[index]['id']}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 13.0, left: 13.0),
                      child: Row(
                        children: [
                          UserAvatar(
                              imagePath: _people[index]["profile_image_name"]),
                          const SizedBox(
                            width: 13,
                          ),
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
                                      text: _people[index]["name"],
                                      size: 18,
                                    ),
                                    GameBadge(
                                      size: _people[index]['games'].length,
                                      gameList:
                                          (_people[index]['games'] as List)
                                              .map((e) => Game(name: e))
                                              .toList(),
                                    ),
                                  ],
                                ),
                                _people[index]['isFollow']
                                    ? TextButton2(
                                        onPressed: () {
                                          _deleteFriendFromMyFriends(
                                              _people[index]['id'], index);
                                        },
                                        text: '취소',
                                        color: context.appColors.subText,
                                      )
                                    : TextButton2(
                                        onPressed: () {
                                          _insertFriendsIntoMyFriends(
                                              _people[index]['id'], index);
                                        },
                                        text: '친구 추가',
                                        color: Colors.blueAccent,
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

  void _initMyGroupDetail() {
    Future<Map<String, dynamic>> response = dioApiGetFriendsByGroupDetail1(
      groupName,
      detail1,
    );
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        List<dynamic> resPeople = res['people'];
        final List<Map> newResPeople = List.generate(resPeople.length,
            (index) => {...resPeople[index], 'isFollow': false});
        List<dynamic> resFriends = res['friends'];
        setState(() {
          _people = newResPeople;
          _friends = resFriends;
        });
      } else if (statusCode == 401) {
        notification(context, "다시 로그인 해주세요");
      }
    });
  }

  void _insertFriendsIntoMyFriends(int userId, int index) async {
    await friendSimpleData.insertFriend(userId);
    setState(() => _people[index]['isFollow'] = true);
  }

  void _deleteFriendFromMyFriends(int userId, index) async {
    await friendSimpleData.deleteFriend(userId);
    setState(() => _people[index]['isFollow'] = false);
  }
}
