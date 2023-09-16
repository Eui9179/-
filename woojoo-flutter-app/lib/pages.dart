import 'package:woojoo/screen/authentication/login/s_login.dart';
import 'package:woojoo/ui/screens/authentication/input_phone_number.dart';
import 'package:woojoo/ui/screens/authentication/signup/step1_profile.dart';
import 'package:woojoo/ui/screens/authentication/signup/step2_tos.dart';
import 'package:woojoo/ui/screens/authentication/verification.dart';
import 'package:woojoo/ui/screens/friends/friends_in_game.dart';
import 'package:woojoo/ui/screens/group/group_detail.dart';
import 'package:woojoo/ui/screens/friends/acquaintance.dart';
import 'package:woojoo/ui/screens/group/group_detail1.dart';
import 'package:woojoo/ui/screens/home/home.dart';
import 'package:woojoo/ui/screens/home/main_page.dart';
import 'package:woojoo/ui/screens/game/select_games.dart';
import 'package:woojoo/ui/screens/setting/settting.dart';
import 'package:woojoo/ui/screens/game/todays_game/todays_game_list.dart';
import 'package:woojoo/ui/screens/users/users.dart';
import 'package:get/get.dart';

import 'main.dart';

List<GetPage> pages = [
  GetPage(name: '/', page: () => const Home()),
  GetPage(
    name: '/login',
    page: () => const LoginScreen(),
    // transition: Transition.rightToLeft
  ),
  GetPage(
      name: '/home',
      page: () => const MainHome(),
      transition: Transition.noTransition),
  GetPage(name: '/main', page: () => const MainPage()),
  GetPage(
      name: '/auth',
      page: () => const InputPhoneNumber(),
      transition: Transition.rightToLeft),
  GetPage(
    name: '/auth/verification',
    page: () => const Verification(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
      name: '/auth/signup/step1',
      page: () => const Step1Profile(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/auth/signup/step2',
      page: () => const Step2TOS(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/setting/games',
      page: () => const SelectGames(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/group/detail',
      page: () => const GroupDetail(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/group/detail1',
      page: () => const GroupDetail1(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/acquaintance',
      page: () => Acquaintance(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/users/:userId',
      page: () => const Users(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/friends/:gameName',
      page: () => const FriendsInGame(),
      transition: Transition.rightToLeft),
  GetPage(
      name: '/setting',
      page: () => const Setting(),
      transition: Transition.rightToLeft),
  GetPage(
    name: '/todays-games',
    page: () => const TodaysGameList(),
  ),
];
