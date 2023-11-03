import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/button/w_text_button2.dart';
import 'package:woojoo/common/widget/w_game_badge.dart';
import 'package:woojoo/data/dto/dto_friend_in_list.dart';
import 'package:woojoo/data/memory/friend/friend_simple_data.dart';

import '../../../common/widget/avatar/w_user_avatar.dart';
import '../../../common/widget/w_dividing_line.dart';
import '../../../common/widget/w_subject_title.dart';
import '../../../common/widget/w_text2.dart';

class UserFriendListFrame extends StatefulWidget {
  const UserFriendListFrame({
    Key? key,
    required this.alreadyFriends,
    required this.userFriends,
    required this.userName,
  }) : super(key: key);

  final List<UserInList> alreadyFriends;
  final List<UserInList> userFriends;
  final String userName;

  @override
  State<UserFriendListFrame> createState() => _UserFriendListFrameState();
}

class _UserFriendListFrameState extends State<UserFriendListFrame>
    with FriendSimpleDataProvider {
  String myFriendString = '';

  @override
  void initState() {
    super.initState();
    _setIsFriend();
    getFriendString();
  }

  @override
  Widget build(BuildContext context) {
    List<UserInList> userFriends = widget.userFriends;

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
                  Get.toNamed('/users/${userFriends[index].userSimple.id}');
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 13.0, left: 13.0),
                  child: Row(
                    children: [
                      UserAvatar(
                          imagePath:
                              userFriends[index].userSimple.profileImageName),
                      const SizedBox(width: 13),
                      Expanded(
                        flex: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GameBadge(gameList: userFriends[index].gameList),
                            (userFriends[index].isFriend != null &&
                                    userFriends[index].isFriend!)
                                ? TextButton2(
                                    onPressed: () {
                                      _deleteFriendFromMyFriends(
                                          userFriends[index].userSimple.id,
                                          index);
                                    },
                                    text: '취소',
                                    color: context.appColors.text,
                                  )
                                : TextButton2(
                                    onPressed: () {
                                      _insertFriendsIntoMyFriends(
                                        userFriends[index].userSimple.id,
                                        index,
                                      );
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
    if (widget.alreadyFriends.length == 1) {
      myFriendString =
          '${widget.alreadyFriends[0].userSimple.name}님과 함께 알고 있습니다.';
    } else if (widget.alreadyFriends.length == 2) {
      myFriendString =
          '${widget.alreadyFriends[0].userSimple.name}, ${widget.alreadyFriends[1].userSimple.name}님과 함께 알고 있습니다.';
    } else if (widget.alreadyFriends.length > 2) {
      myFriendString =
          '${widget.alreadyFriends[0].userSimple.name}, ${widget.alreadyFriends[1].userSimple.name}님 외 ${widget.alreadyFriends.length - 2}명과 함께 알고 있습니다.';
    }
  }

  void _insertFriendsIntoMyFriends(int friendId, int index) async {
    await friendSimpleData.insertFriend(friendId);
    setState(() => widget.userFriends[index].isFriend = true);
  }

  void _deleteFriendFromMyFriends(int friendId, int index) async {
    await friendSimpleData.deleteFriend(friendId);
    setState(() => widget.userFriends[index].isFriend = false);
  }

  void _setIsFriend() {
    setState(() {
      for (UserInList friend in widget.userFriends) {
        friend.isFriend = false;
      }
    });
  }
}
