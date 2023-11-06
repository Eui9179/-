import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:woojoo/common/get_it/get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void initGetIt() => getIt.init();