// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto_user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  UserSimple get userSimple => throw _privateConstructorUsedError;
  bool get isFriend => throw _privateConstructorUsedError;
  Group get group => throw _privateConstructorUsedError;
  List<Game> get games => throw _privateConstructorUsedError;
  List<UserInList> get alreadyFriends => throw _privateConstructorUsedError;
  List<UserInList> get userFriends => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {UserSimple userSimple,
      bool isFriend,
      Group group,
      List<Game> games,
      List<UserInList> alreadyFriends,
      List<UserInList> userFriends});

  $UserSimpleCopyWith<$Res> get userSimple;
  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSimple = null,
    Object? isFriend = null,
    Object? group = null,
    Object? games = null,
    Object? alreadyFriends = null,
    Object? userFriends = null,
  }) {
    return _then(_value.copyWith(
      userSimple: null == userSimple
          ? _value.userSimple
          : userSimple // ignore: cast_nullable_to_non_nullable
              as UserSimple,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      games: null == games
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
      alreadyFriends: null == alreadyFriends
          ? _value.alreadyFriends
          : alreadyFriends // ignore: cast_nullable_to_non_nullable
              as List<UserInList>,
      userFriends: null == userFriends
          ? _value.userFriends
          : userFriends // ignore: cast_nullable_to_non_nullable
              as List<UserInList>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserSimpleCopyWith<$Res> get userSimple {
    return $UserSimpleCopyWith<$Res>(_value.userSimple, (value) {
      return _then(_value.copyWith(userSimple: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserSimple userSimple,
      bool isFriend,
      Group group,
      List<Game> games,
      List<UserInList> alreadyFriends,
      List<UserInList> userFriends});

  @override
  $UserSimpleCopyWith<$Res> get userSimple;
  @override
  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSimple = null,
    Object? isFriend = null,
    Object? group = null,
    Object? games = null,
    Object? alreadyFriends = null,
    Object? userFriends = null,
  }) {
    return _then(_$UserInfoImpl(
      userSimple: null == userSimple
          ? _value.userSimple
          : userSimple // ignore: cast_nullable_to_non_nullable
              as UserSimple,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      games: null == games
          ? _value._games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
      alreadyFriends: null == alreadyFriends
          ? _value._alreadyFriends
          : alreadyFriends // ignore: cast_nullable_to_non_nullable
              as List<UserInList>,
      userFriends: null == userFriends
          ? _value._userFriends
          : userFriends // ignore: cast_nullable_to_non_nullable
              as List<UserInList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  _$UserInfoImpl(
      {required this.userSimple,
      required this.isFriend,
      required this.group,
      required final List<Game> games,
      required final List<UserInList> alreadyFriends,
      required final List<UserInList> userFriends})
      : _games = games,
        _alreadyFriends = alreadyFriends,
        _userFriends = userFriends;

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final UserSimple userSimple;
  @override
  final bool isFriend;
  @override
  final Group group;
  final List<Game> _games;
  @override
  List<Game> get games {
    if (_games is EqualUnmodifiableListView) return _games;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_games);
  }

  final List<UserInList> _alreadyFriends;
  @override
  List<UserInList> get alreadyFriends {
    if (_alreadyFriends is EqualUnmodifiableListView) return _alreadyFriends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alreadyFriends);
  }

  final List<UserInList> _userFriends;
  @override
  List<UserInList> get userFriends {
    if (_userFriends is EqualUnmodifiableListView) return _userFriends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userFriends);
  }

  @override
  String toString() {
    return 'UserInfo(userSimple: $userSimple, isFriend: $isFriend, group: $group, games: $games, alreadyFriends: $alreadyFriends, userFriends: $userFriends)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.userSimple, userSimple) ||
                other.userSimple == userSimple) &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.group, group) || other.group == group) &&
            const DeepCollectionEquality().equals(other._games, _games) &&
            const DeepCollectionEquality()
                .equals(other._alreadyFriends, _alreadyFriends) &&
            const DeepCollectionEquality()
                .equals(other._userFriends, _userFriends));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userSimple,
      isFriend,
      group,
      const DeepCollectionEquality().hash(_games),
      const DeepCollectionEquality().hash(_alreadyFriends),
      const DeepCollectionEquality().hash(_userFriends));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  factory _UserInfo(
      {required final UserSimple userSimple,
      required final bool isFriend,
      required final Group group,
      required final List<Game> games,
      required final List<UserInList> alreadyFriends,
      required final List<UserInList> userFriends}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  UserSimple get userSimple;
  @override
  bool get isFriend;
  @override
  Group get group;
  @override
  List<Game> get games;
  @override
  List<UserInList> get alreadyFriends;
  @override
  List<UserInList> get userFriends;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
