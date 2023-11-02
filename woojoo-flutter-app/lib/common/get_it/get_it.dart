import 'package:get_it/get_it.dart';
import 'package:woojoo/data/memory/user/user_data.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<UserData>(UserData());
}