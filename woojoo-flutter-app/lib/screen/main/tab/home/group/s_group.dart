import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/avatar/w_user_avatar.dart';
import 'package:woojoo/common/widget/w_dividing_line.dart';
import 'package:woojoo/common/widget/avatar/w_group_avatar.dart';
import 'package:woojoo/common/widget/button/w_text_button2.dart';
import 'package:woojoo/utils/notification.dart';

import '../../../../../../common/widget/w_game_badge.dart';
import '../../../../../../data/controller/my_friends_controller.dart';
import '../../../../../../data/memory/authentication/access_token_data.dart';
import '../../../../../../data/remote/friend/delete_friend.dart';
import '../../../../../../data/remote/friend/insert_friend.dart';
import '../../../../../../data/remote/friend/insert_friends.dart';
import '../../../../../../data/remote/group/get_people_by_group.dart';
import '../../../../../../common/widget/w_text2.dart';
import '../../../../../../common/widget/w_subject_title.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  List<dynamic> _people = [];
  List<dynamic> _friends = [];
  String myFriendString = '';
  String _accessToken = '';

  @override
  void initState() {
    super.initState();
    _initMyGroupDetail();
  }

  final String groupName = Get.parameters["name"]!;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // followController();
        return true;
      },
      child: Scaffold(
        backgroundColor: context.appColors.mainBackgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: context.appColors.headerBackgroundColor,
          title: Text(
            "학교 게임 친구",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: context.appColors.font),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13.0, left: 13.0),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: GroupAvatar(image: groupName)),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text2(
                          text: groupName,
                          size: 23,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SubjectTitle(
                          title:
                              '${_people.length + _friends.length}명이 소속되어 있습니다.',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (_friends.isNotEmpty)
                InkWell(
                  splashColor: context.appColors.headerBackgroundColor,
                  onTap: () {
                    Get.toNamed('/acquaintance',
                        arguments: {'friends': _friends, 'kinds': groupName});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13.0, left: 13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DividingLine(),
                        Container(
                          margin: const EdgeInsets.only(top: 4, bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.people,
                                      color: Colors.white, size: 16),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text2(text: myFriendString, size: 16),
                                ],
                              ),
                              const Icon(Icons.chevron_right,
                                  color: Colors.white, size: 20),
                            ],
                          ),
                        ),
                        const DividingLine(),
                      ],
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
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
                        SubjectTitle(title: '${_people.length.toString()} 명'),
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
                              imagePath: _people[index]["profile_image_name"],
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Expanded(
                              flex: 8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text2(
                                        text: _people[index]["name"],
                                        size: 18,
                                      ),
                                      GameBadge(
                                        size: _people[index]['games'].length,
                                        gameNames: _people[index]['games'],
                                      ),
                                    ],
                                  ),
                                  _people[index]['isFollow']
                                      ? TextButton2(
                                          onPressed: () {
                                            setState(() {
                                              _people[index]['isFollow'] =
                                                  false;
                                            });
                                            deleteFriendFromMyFriends(
                                                _people[index]['id']);
                                          },
                                          text: '취소',
                                          color: context.appColors.subFont,
                                        )
                                      : TextButton2(
                                          onPressed: () {
                                            setState(() {
                                              _people[index]['isFollow'] = true;
                                            });
                                            insertFriendsIntoMyFriends(
                                                _people[index]['id']);
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
      ),
    );
  }

  void _initMyGroupDetail() {
    _accessToken = Get.find<AccessTokenData>().accessToken;

    Future<Map<String, dynamic>> response =
        dioApiGetPeopleByGroup(_accessToken, groupName);
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
          if (_friends.length == 1) {
            myFriendString = '${_friends[0]["name"]}님이 친구입니다.';
          } else if (_friends.length == 2) {
            myFriendString =
                '${_friends[0]["name"]}, ${_friends[1]["name"]}님이 친구입니다.';
          } else if (_friends.length > 2) {
            myFriendString =
                '${_friends[0]["name"]}, ${_friends[1]["name"]}님 외 ${_friends.length - 2}명이 친구입니다.';
          }
        });
      } else if (statusCode == 401) {
        notification(context, "다시 로그인 해주세요");
      }
    });
  }

  insertFriendsIntoMyFriends(int userId) {
    String accessToken = Get.find<AccessTokenData>().accessToken;
    Future<Map<String, dynamic>> response =
        dioApiInsertFriendOne(accessToken, userId);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        List<dynamic> originalFriends =
            Get.find<MyFriendsController>().myFriends;
        Get.find<MyFriendsController>()
            .setMyFriends([res['data'], ...originalFriends]);
      } else if (statusCode == 409) {
        notification(context, '이미 등록된 친구입니다.', warning: false);
      } else {
        print('insertFriendsIntoFriends(): $statusCode');
      }
    });
  }

  deleteFriendFromMyFriends(int userId) {
    String accessToken = Get.find<AccessTokenData>().accessToken;
    Future<Map<String, dynamic>> response =
        dioApiDeleteFriendOne(accessToken, userId);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        List<dynamic> originalFriends =
            Get.find<MyFriendsController>().myFriends;
        for (int i = 0; i < originalFriends.length; i++) {
          if (originalFriends[i]['id'] == userId) {
            originalFriends.removeAt(i);
            break;
          }
        }
        Get.find<MyFriendsController>().setMyFriends([...originalFriends]);
      } else {
        print('insertFriendsIntoFriends(): $statusCode');
      }
    });
  }

  void followController() {
    List<int> peopleToBeFriends = [];
    for (var person in _people) {
      if (person['isFollow']) {
        peopleToBeFriends.add(person['id']);
      }
    }
    if (peopleToBeFriends.isNotEmpty) {
      Future<Map<String, dynamic>> response =
          dioApiInsertFriends(_accessToken, peopleToBeFriends);
      response.then((res) {
        int statusCode = res['statusCode'];
        if (statusCode == 200) {
          List<dynamic> addedFriends = res['data'];
          List<dynamic> originalFriends =
              Get.find<MyFriendsController>().myFriends;
          Get.find<MyFriendsController>()
              .setMyFriends([...addedFriends, ...originalFriends]);
        } else {
          notification(context, "[$statusCode] 친구 등록할 때 문제가 발생했습니다. 다시 시도해주세요");
        }
      });
    }
  }
}