import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/logo/w_logo.dart';
import 'package:woojoo/common/widget/w_text2.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/authentication/authentication_data.dart';

import '../../../data/controller/fcm_token_controller.dart';
import '../../../data/controller/my_friends_controller.dart';
import '../../../data/controller/my_games_controller.dart';
import '../../../data/remote/friend/get_my_friends.dart';
import '../../../data/remote/game/get_my_games.dart';
import 'tab/home/s_home.dart';
import 'tab/setting/s_settting.dart';
import 'tab/todays_game/s_todays_game_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AuthenticationDataProvider, AccessTokenDataProvider {
  int _selectedIndex = 0;
  bool _isLoading = true;
  PageController pageController = PageController();

  final List<Widget> _widgetOptions = [
    const MainPage(),
    const TodaysGameListScreen(),
    const SettingScreen(),
  ];

  @override
  void initState() {
    super.initState();

    _initUserData().then((val) {
      // Timer(const Duration(milliseconds: 1200), () {
      //   setState(() {
      //     _isLoading = false;
      //   });
      // });
    });
  }

  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // if (_isLoading) {
    //   return const MainLoadingScreen();
    // }
    return Scaffold(
      backgroundColor: context.appColors.mainBackgroundColor,
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
        selectedItemColor: context.appColors.font,
        unselectedItemColor: context.appColors.subFont,
        backgroundColor: context.appColors.navigationBarColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget navigationTitle() {
    if (_selectedIndex == 0) {
      return const Logo();
    } else if (_selectedIndex == 1) {
      return const Text2(text: '오늘의 게임', size: 22);
    } else {
      return const Text2(text: '설정', size: 22);
    }
  }

  Future<bool> _initUserData() async {
    final String accessToken = accessTokenData.accessToken;
    _syncFcmToken(accessToken);
    _initMyGameList(accessToken);
    _initMyFriendList(accessToken);
    return true;
  }

  void _syncFcmToken(String accessToken) {
    String fcm = Get.find<FcmTokenController>().fcmToken;
    // userRepository.syncFcm(FcmRequest(fcm: fcm));
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
