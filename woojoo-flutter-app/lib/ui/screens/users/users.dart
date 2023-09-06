import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/dio/profile/get_user.dart';
import 'package:woojoo/ui/dynamic_widget/font/font.dart';
import 'package:woojoo/ui/screens/home/profile_loading_screen.dart';
import 'package:woojoo/ui/screens/users/report.dart';
import 'package:woojoo/ui/screens/users/user_friends.dart';
import 'package:woojoo/ui/screens/users/user_games.dart';
import 'package:woojoo/ui/screens/users/user_groups.dart';
import 'package:woojoo/ui/screens/users/user_profile.dart';
import 'package:woojoo/common/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'block.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
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
                        child: Font(text: choice, size: 18),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  UserProfile(userProfile: _userProfile, isFriend: _isFriend),
                  UserGroups(
                    userGroups: _userGroups,
                  ),
                  UserGames(
                      userGames: _userGames, userName: _userProfile['name']),
                  UserFriends(
                      alreadyFriends: _alreadyFriends,
                      userFriends: _userFriends,
                      userName: _userProfile['name'])
                ],
              ),
            ));
  }

  _initUser() {
    String accessToken = Get.find<AccessTokenController>().accessToken;
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
