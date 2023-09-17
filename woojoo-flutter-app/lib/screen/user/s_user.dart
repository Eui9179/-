import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/common/widget/w_text2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/dialog/d_report.dart';
import 'package:woojoo/screen/user/f_user_friend_list.dart';
import 'package:woojoo/screen/user/f_user_game_list.dart';
import 'package:woojoo/screen/user/f_user_group.dart';
import 'package:woojoo/screen/user/f_user_profile.dart';

import '../../../data/remote/profile/get_user.dart';
import '../../dialog/d_block.dart';
import '../../screen/main/tab/home/profile_loading_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final int userId = int.parse(Get.parameters['userId']!);
  Map<String, dynamic> _userProfile = {};
  List<dynamic> _userGroups = [];
  List<dynamic> _userGames = [];
  List<dynamic> _alreadyFriends = [];
  List<dynamic> _userFriends = [];
  bool _isFriend = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initUser();
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
                  UserProfileFrame(userProfile: _userProfile, isFriend: _isFriend),
                  UserGroupFrame(
                    userGroups: _userGroups,
                  ),
                  UserGameListFrame(
                      userGames: _userGames, userName: _userProfile['name']),
                  UserFriendListFrame(
                      alreadyFriends: _alreadyFriends,
                      userFriends: _userFriends,
                      userName: _userProfile['name'])
                ],
              ),
            ));
  }

  _initUser() {
    String accessToken = Get.find<AccessTokenData>().accessToken;
    Future<Map<String, dynamic>> response = dioApiUser(accessToken, userId);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        _userProfile = res['data']['userProfile'];
        _isFriend = res['data']['isFriend'];
        _userGroups = res['data']['userGroups'];
        _userGames = res['data']['userGames'];
        _alreadyFriends = res['data']['alreadyFriends'];
        _userFriends = res['data']['userFriends'];

        setState(() {
          isLoading = false;
        });
      } else {
        print('users initUser: $statusCode');
      }
    });
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
