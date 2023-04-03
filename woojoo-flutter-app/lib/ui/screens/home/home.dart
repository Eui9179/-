import 'dart:async';

import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/controller/fcm_token_controller.dart';
import 'package:woojoo/controller/my_friends_controller.dart';
import 'package:woojoo/controller/my_games_controller.dart';
import 'package:woojoo/controller/my_groups_controller.dart';
import 'package:woojoo/controller/my_profile_controller.dart';
import 'package:woojoo/dio/auth/async_fcm_token.dart';
import 'package:woojoo/dio/friend/get_my_friends.dart';
import 'package:woojoo/dio/game/get_my_games.dart';
import 'package:woojoo/dio/group/get_my_groups.dart';
import 'package:woojoo/dio/profile/get_my_profile.dart';
import 'package:woojoo/ui/dynamic_widget/font/font.dart';
import 'package:woojoo/ui/screens/home/main_page.dart';
import 'package:woojoo/ui/screens/main_loading_screen.dart';
import 'package:woojoo/ui/screens/setting/settting.dart';
import 'package:woojoo/ui/screens/game/todays_game/todays_game_list.dart';
import 'package:woojoo/ui/static_widget/woojoo_logo.dart';
import 'package:woojoo/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;
  bool _isLoading = true;
  PageController pageController = PageController();

  final List<Widget> _widgetOptions = [
    const MainPage(),
    const TodaysGameList(),
    const Setting(),
  ];

  @override
  void initState() {
    super.initState();

    _initUserData().then((val) {
      Timer(const Duration(milliseconds: 1200), () {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const MainLoadingScreen();
    }
    return Scaffold(
      backgroundColor: ColorPalette.mainBackgroundColor,
      // body: SafeArea(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: '오늘의 게임',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorPalette.font,
        unselectedItemColor: ColorPalette.subFont,
        backgroundColor: ColorPalette.navigationBarColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget navigationTitle() {
    if (_selectedIndex == 0) {
      return const WoojooLogo();
    } else if (_selectedIndex == 1) {
      return const Font(text: '오늘의 게임', size: 22);
    } else {
      return const Font(text: '설정', size: 22);
    }
  }

  Future<bool> _initUserData() async {
    String accessToken = Get.find<AccessTokenController>().accessToken;
    _asyncFcmToken(accessToken);
    // _initMyProfile(accessToken);
    _initMyGroups(accessToken);
    _initMyGameList(accessToken);
    _initMyFriendList(accessToken);
    return true;
  }

  void _asyncFcmToken(String accessToken) {
    String fcmToken = Get.find<FcmTokenController>().fcmToken;
    Future<Map<String, dynamic>> response =
        dioApiAsyncFcmToken(accessToken, fcmToken);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode != 200) {
        print(statusCode);
      }
    });
  }

  void _initMyProfile(String accessToken) {
    Future<Map<String, dynamic>> response = dioApiGetMyProfile(accessToken);
    response.then((res) {
      int statusCode = res["statusCode"];
      if (statusCode == 200 && res["data"] != null) {
        Map<String, dynamic> profileData = res["data"];
        Get.find<MyProfileController>().setMyProfile(profileData["name"],
            profileData["profile_image_name"], profileData["phone_number"]);
      } else {
        Get.toNamed("/login");
      }
    });
  }

  void _initMyGroups(String accessToken) {
    Future<Map<String, dynamic>> response = dioApiGetMyGroups(accessToken);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        Get.find<MyGroupsController>().setMyGroups(res['data']);
      } else if (statusCode == 401) {}
    });
  }

  void _initMyGameList(String accessToken) {
    Future<dynamic> response = dioApiGetMyGames(accessToken);
    response.then((res) {
      int statusCode = res["statusCode"];
      if (statusCode == 200) {
        Get.find<MyGamesController>().setMyGames(res['data']);
      } else if (statusCode == 401) {}
    });
  }

  void _initMyFriendList(String accessToken) {
    Future<dynamic> response = dioApiGetMyFriends(accessToken);
    response.then((res) {
      int statusCode = res["statusCode"];
      if (statusCode == 200) {
        Get.find<MyFriendsController>().setMyFriends(res['data']);
      } else if (statusCode == 401) {
      } else {
        print('_getMyFriendList() error: $statusCode');
      }
    });
  }
}
