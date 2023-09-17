import 'package:woojoo/app.dart';
import 'package:woojoo/screen/authentication/login_input/s_login_input.dart';
import 'package:woojoo/screen/authentication/s_login.dart';
import 'package:woojoo/screen/authentication/verification/s_verification.dart';

import 'package:get/get.dart';
import 'package:woojoo/screen/authentication/signup/s_step1_profile.dart';
import 'package:woojoo/screen/authentication/signup/s_step2_tos.dart';
import 'package:woojoo/screen/game_setting/s_game_setting.dart';
import 'package:woojoo/screen/main/tab/home/game_friend_list/s_game_friend_list.dart';
import 'package:woojoo/screen/acquaintance/s_acquaintance.dart';
import 'package:woojoo/screen/main/tab/todays_game/s_todays_game_list.dart';
import 'package:woojoo/screen/main/tab/home/group/s_group.dart';
import 'package:woojoo/screen/main/tab/home/group/s_group_detail.dart';
import 'package:woojoo/screen/main/s_main.dart';
import 'package:woojoo/screen/main/tab/home/s_home.dart';
import 'package:woojoo/screen/main/tab/setting/s_settting.dart';
import 'package:woojoo/screen/user/s_user.dart';

List<GetPage> pages = [
  GetPage(name: '/', page: () => const App()),
  GetPage(
    name: '/login',
    page: () => const LoginScreen(),
  ),
  GetPage(
      name: '/home',
      page: () => const MainScreen(),
      transition: Transition.noTransition),
  GetPage(name: '/main', page: () => const MainPage()),
  GetPage(
      name: '/login-input',
      page: () => const LoginInput(),
      transition: Transition.rightToLeft),
  GetPage(
    name: '/auth/verification',
    page: () => const VerificationScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
      name: '/auth/signup/step1',
      page: () => const Step1ProfileScreen(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/auth/signup/step2',
      page: () => const Step2TOSScreen(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/setting/games',
      page: () => const GameSettingScreen(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/group/detail',
      page: () => const GroupScreen(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/group/detail1',
      page: () => const GroupDetailScreen(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/acquaintance',
      page: () => AcquaintanceScreen(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/users/:userId',
      page: () => const UserScreen(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/friends/:gameName',
      page: () => const GameFriendListScreen(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/setting',
      page: () => const SettingScreen(),
      transition: Transition.rightToLeft),
  GetPage(
    name: '/todays-games',
    page: () => const TodaysGameListScreen(),
  ),
];
