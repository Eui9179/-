import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/button/w_text_button2.dart';
import 'package:woojoo/data/dto/dto_user_simple.dart';
import 'package:woojoo/data/memory/friend/friend_simple_data.dart';

import '../../../common/widget/avatar/w_profile_avatar.dart';

class UserProfileFrame extends StatefulWidget {
  const UserProfileFrame({
    Key? key,
    required this.userSimple,
    required this.isFriend,
  }) : super(key: key);

  final UserSimple userSimple;
  final bool isFriend;

  @override
  State<UserProfileFrame> createState() => _UserProfileFrameState();
}

class _UserProfileFrameState extends State<UserProfileFrame>
    with FriendSimpleDataProvider {
  bool isFriend = false;
  String buttonText = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      isFriend = widget.isFriend;
      widget.isFriend ? (buttonText = '친구 삭제') : (buttonText = '친구 추가');
    });
  }

  @override
  Widget build(BuildContext context) {
    UserSimple userSimple = widget.userSimple;
    String? userProfileImageName = userSimple.profileImageName;
    String name = userSimple.name;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 15, bottom: 5, right: 13, left: 13),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.appColors.headerBackgroundColor,
            context.appColors.mainBackgroundColor
          ],
          stops: const [0.4, 0.4],
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ProfileAvatar(image: userProfileImageName, size: 45),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: context.appColors.text)),
            isFriend
                ? TextButton2(
                    onPressed: () => _deleteFriendFromMyFriends(),
                    text: buttonText,
                    color: context.appColors.subText,
                  )
                : TextButton2(
                    onPressed: () => _insertFriendsIntoMyFriends(),
                    text: buttonText,
                    color: Colors.blueAccent,
                  )
          ],
        ),
      ]),
    );
  }

  void _insertFriendsIntoMyFriends() async {
    await friendSimpleData.insertFriend(widget.userSimple.id);
    setState(() {
      isFriend = !isFriend;
      buttonText = '취소';
    });
  }

  void _deleteFriendFromMyFriends() async {
    await friendSimpleData.deleteFriend(widget.userSimple.id);
    setState(() {
      isFriend = !isFriend;
      buttonText = '친구 추가';
    });
  }
}
