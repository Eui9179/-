// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:woojoo/data/memory/user/user_data.dart' as _i16;
import 'package:woojoo/data/remote/api/authentication/authentication_api.dart'
    as _i4;
import 'package:woojoo/data/remote/api/authentication/authentication_repository.dart'
    as _i3;
import 'package:woojoo/data/remote/api/authentication/verification/verification_api.dart'
    as _i18;
import 'package:woojoo/data/remote/api/authentication/verification/verification_repository.dart'
    as _i17;
import 'package:woojoo/data/remote/api/friend/friend_api.dart' as _i6;
import 'package:woojoo/data/remote/api/friend/friend_repository.dart' as _i5;
import 'package:woojoo/data/remote/api/game/game_api.dart' as _i8;
import 'package:woojoo/data/remote/api/game/game_repository.dart' as _i7;
import 'package:woojoo/data/remote/api/game/todays_game/todays_game_api.dart'
    as _i14;
import 'package:woojoo/data/remote/api/game/todays_game/todays_game_repository.dart'
    as _i13;
import 'package:woojoo/data/remote/api/group/group_api.dart' as _i10;
import 'package:woojoo/data/remote/api/group/group_repository.dart' as _i9;
import 'package:woojoo/data/remote/api/my_profile/my_profile_api.dart' as _i12;
import 'package:woojoo/data/remote/api/my_profile/my_profile_repository.dart'
    as _i11;
import 'package:woojoo/data/remote/api/user/user_api.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthenticationRepository>(_i4.AuthenticationApi());
    gh.singleton<_i5.FriendRepository>(_i6.FriendApi());
    gh.singleton<_i7.GameRepository>(_i8.GameApi());
    gh.singleton<_i9.GroupRepository>(_i10.GroupApi());
    gh.singleton<_i11.MyProfileRepository>(_i12.MyProfileApi());
    gh.singleton<_i13.TodaysGameRepository>(_i14.TodaysGameApi());
    gh.singleton<_i15.UserApi>(_i15.UserApi());
    gh.singleton<_i16.UserData>(_i16.UserData());
    gh.singleton<_i17.VerificationRepository>(_i18.VerificationApi());
    return this;
  }
}
