import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/logo/w_logo.dart';
import 'package:woojoo/common/widget/w_text2.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/authentication/authentication_data.dart';

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
  PageController pageController = PageController();

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const TodaysGameListScreen(),
    const SettingScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
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
        selectedItemColor: context.appColors.text,
        unselectedItemColor: context.appColors.subText,
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
}
