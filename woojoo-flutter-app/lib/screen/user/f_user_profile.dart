import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/common/widget/button/w_text_button2.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/avatar/w_profile_avatar.dart';
import '../../../data/controller/my_friends_controller.dart';
import '../../../data/remote/friend/delete_friend.dart';
import '../../../data/remote/friend/insert_friend.dart';


class UserProfileFrame extends StatefulWidget {
  const UserProfileFrame(
      {Key? key, required this.userProfile, required this.isFriend})
      : super(key: key);
  final Map<String, dynamic> userProfile;
  final bool isFriend;

  @override
  State<UserProfileFrame> createState() => _UserProfileFrameState();
}

class _UserProfileFrameState extends State<UserProfileFrame> {
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
    String? userProfileImageName = widget.userProfile['profile_image_name'];
    String name = widget.userProfile['name']!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 15, bottom: 20, right: 13, left: 13),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.appColors.headerBackgroundColor,
                context.appColors.mainBackgroundColor
          ],
              stops: const [
            0.4,
            0.4
          ])),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ProfileAvatar(image: userProfileImageName, size: 45),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: context.appColors.font)),
            isFriend
                ? TextButton2(
                    onPressed: () {
                      deleteFriendFromMyFriends();
                    },
                    text: buttonText,
                    color: context.appColors.subFont,
                  )
                : TextButton2(
                    onPressed: () {
                      insertFriendsIntoMyFriends();
                    },
                    text: buttonText,
                    color: Colors.blueAccent,
                  )
          ],
        ),
      ]),
    );
  }

  insertFriendsIntoMyFriends() {
    String accessToken = Get.find<AccessTokenData>().accessToken;
    Future<Map<String, dynamic>> response =
        dioApiInsertFriendOne(accessToken, widget.userProfile['user_id']);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        List<dynamic> originalFriends =
            Get.find<MyFriendsController>().myFriends;
        Get.find<MyFriendsController>()
            .setMyFriends([res['data'], ...originalFriends]);
        setState(() {
          isFriend = !isFriend;
          buttonText = '취소';
        });
      } else if (statusCode == 409) {
        notification(context, '이미 등록된 친구입니다.', warning: false);
      } else {
        print('insertFriendsIntoFriends(): $statusCode');
      }
    });
  }

  deleteFriendFromMyFriends() {
    String accessToken = Get.find<AccessTokenData>().accessToken;
    Future<Map<String, dynamic>> response =
        dioApiDeleteFriendOne(accessToken, widget.userProfile['user_id']);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        List<dynamic> originalFriends =
            Get.find<MyFriendsController>().myFriends;
        for (int i = 0; i < originalFriends.length; i++) {
          if (originalFriends[i]['id'] == widget.userProfile['user_id']) {
            originalFriends.removeAt(i);
            break;
          }
        }
        Get.find<MyFriendsController>().setMyFriends([...originalFriends]);
        setState(() {
          isFriend = !isFriend;
          buttonText = '친구 추가';
        });
      } else {
        print('insertFriendsIntoFriends(): $statusCode');
      }
    });
  }
}
