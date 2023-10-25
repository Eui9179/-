import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/button/w_text_button2.dart';
import 'package:woojoo/data/memory/friend/friend_simple_data.dart';

import '../../../common/constants.dart';
import '../../../common/widget/avatar/w_avatar.dart';
import '../../../common/widget/avatar/w_user_avatar.dart';
import '../../../common/widget/w_dividing_line.dart';
import '../../../common/widget/w_subject_title.dart';
import '../../../common/widget/w_text2.dart';

/// TODO Refactoring
class UserFriendListFrame extends StatefulWidget {
  const UserFriendListFrame({
    Key? key,
    required this.alreadyFriends,
    required this.userFriends,
    required this.userName,
  }) : super(key: key);

  final List<dynamic> alreadyFriends;
  final List<dynamic> userFriends;
  final String userName;

  @override
  State<UserFriendListFrame> createState() => _UserFriendListFrameState();
}

class _UserFriendListFrameState extends State<UserFriendListFrame>
    with FriendSimpleDataProvider {
  List<dynamic> userFriends = [];
  String myFriendString = '';

  @override
  void initState() {
    super.initState();
    getFriendString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              right: 13.0, left: 13.0, top: 15.0, bottom: 5.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SubjectTitle('${widget.userName}님의 게임 친구'),
            SubjectTitle(
                '${userFriends.length + widget.alreadyFriends.length} 명'),
          ]),
        ),
        if (widget.alreadyFriends.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 13.0, left: 13.0),
            child: InkWell(
              splashColor: context.appColors.headerBackgroundColor,
              onTap: () {
                Get.toNamed('/acquaintance', arguments: {
                  'friends': widget.alreadyFriends,
                  'kinds': '함께 아는 친구'
                });
              },
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
                        Icon(
                          Icons.chevron_right,
                          color: context.appColors.text,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  const DividingLine(),
                ],
              ),
            ),
          ),
        if (userFriends.isNotEmpty) ...[
          ListView.builder(
            shrinkWrap: true,
            itemExtent: 75.0,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: userFriends.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.toNamed('/users/${userFriends[index]['id']}');
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 13.0, left: 13.0),
                  child: Row(
                    children: [
                      UserAvatar(
                          imagePath: userFriends[index]["profileImageName"]),
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
                                    text: userFriends[index]["name"], size: 18),
                                userFriends[index]['games'].length != 0
                                    ? const SizedBox(height: 8)
                                    : const SizedBox(),
                                userFriends[index]['games'].length != 0
                                    ? Row(
                                        children: [
                                          if (userFriends[index]['games']
                                                  .length ==
                                              1) ...[
                                            Avatar(
                                              imagePath:
                                                  '$basePath/${userFriends[index]['games'][0]}',
                                              radius: Avatar.gameAvatarSize,
                                            ),
                                            const SizedBox(width: 5),
                                            const SubjectTitle("함께 하는 게임 1개")
                                          ],
                                          if (userFriends[index]['games']
                                                  .length >
                                              1) ...[
                                            SizedBox(
                                              width: 52,
                                              child: Stack(children: [
                                                Positioned(
                                                  left: 18,
                                                  child: Avatar(
                                                    imagePath:
                                                        '$basePath/${userFriends[index]['games'][1]}',
                                                    radius:
                                                        Avatar.gameAvatarSize,
                                                  ),
                                                ),
                                                Positioned(
                                                    child: Avatar(
                                                  imagePath:
                                                      '$basePath/${userFriends[index]['games'][0]}',
                                                  radius: Avatar.gameAvatarSize,
                                                )),
                                              ]),
                                            ),
                                            SubjectTitle(
                                              "함께 하는 게임 ${userFriends[index]['games'].length}개",
                                            )
                                          ]
                                        ],
                                      )
                                    : const SizedBox()
                              ],
                            ),
                            userFriends[index]['isFollow']
                                ? TextButton2(
                                    onPressed: () {
                                      _deleteFriendFromMyFriends(
                                          userFriends[index]['id'], index);
                                    },
                                    text: '취소',
                                    color: context.appColors.text,
                                  )
                                : TextButton2(
                                    onPressed: () {
                                      _insertFriendsIntoMyFriends(
                                          userFriends[index]['id'], index);
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
            },
          ),
        ]
      ],
    );
  }

  getFriendString() {
    setState(() => userFriends = List.generate(widget.userFriends.length,
          (index) => {...widget.userFriends[index], 'isFollow': false}));
    if (widget.alreadyFriends.length == 1) {
      myFriendString = '${widget.alreadyFriends[0]["name"]}님과 함께 알고 있습니다.';
    } else if (widget.alreadyFriends.length == 2) {
      myFriendString =
          '${widget.alreadyFriends[0]["name"]}, ${widget.alreadyFriends[1]["name"]}님과 함께 알고 있습니다.';
    } else if (widget.alreadyFriends.length > 2) {
      myFriendString =
          '${widget.alreadyFriends[0]["name"]}, ${widget.alreadyFriends[1]["name"]}님 외 ${widget.alreadyFriends.length - 2}명과 함께 알고 있습니다.';
    }
  }

  void _insertFriendsIntoMyFriends(int friendId, int index) async {
    await friendSimpleData.insertFriend(friendId);
    setState(() => userFriends[index]['isFollow'] = true);
  }

  void _deleteFriendFromMyFriends(int friendId, int index) async {
    await friendSimpleData.deleteFriend(friendId);
    setState(() => userFriends[index]['isFollow'] = false);
  }
}
