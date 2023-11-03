import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/common/widget/w_text2.dart';
import 'package:woojoo/data/dto/dto_user_info.dart';
import 'package:woojoo/data/memory/user/user_data.dart';
import 'package:woojoo/dialog/d_block.dart';
import 'package:woojoo/dialog/d_report.dart';
import 'package:woojoo/screen/main/tab/home/s_profile_loading.dart';
import 'package:woojoo/screen/user/f_user_friend_list.dart';
import 'package:woojoo/screen/user/f_user_game_list.dart';
import 'package:woojoo/screen/user/f_user_group.dart';
import 'package:woojoo/screen/user/f_user_profile.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final int userId = int.parse(Get.parameters['userId']!);
  late UserInfo _userInfo;
  bool isLoading = true;

  @override
  void initState() {
    _initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const ProfileLoadingScreen()
        : Scaffold(
            backgroundColor: context.appColors.mainBackgroundColor,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: context.appColors.headerBackgroundColor,
              actions: [
                PopupMenuButton(
                  icon: Icon(Icons.more_vert, color: context.appColors.text,),
                  onSelected: _userMoreHandler,
                  color: context.appColors.headerBackgroundColor,
                  itemBuilder: (BuildContext context) {
                    return {'차단하기', '신고하기'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text2(text: choice, size: 18),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  UserProfileFrame(
                    userSimple: _userInfo.userSimple,
                    isFriend: _userInfo.isFriend,
                  ),
                  UserGroupFrame(
                    group: _userInfo.group,
                  ),
                  UserGameListFrame(
                    games: _userInfo.games,
                    userName: _userInfo.userSimple.name,
                  ),
                  UserFriendListFrame(
                    alreadyFriends: _userInfo.alreadyFriends,
                    userFriends: _userInfo.userFriends,
                    userName: _userInfo.userSimple.name,
                  )
                ],
              ),
            ),
          );
  }
  
  _initUser() async {
    _userInfo = await getIt.get<UserData>().getUserInfo(userId);
    setState(() => isLoading = false);
  }

  _userMoreHandler(String value) {
    switch (value) {
      case '차단하기':
        showBlockDialog(context, userId);
        break;
      case '신고하기':
        showReport(context, userId);
        break;
    }
  }
}
