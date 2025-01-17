// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto_todays_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodaysGame _$TodaysGameFromJson(Map<String, dynamic> json) {
  return _TodaysGame.fromJson(json);
}

/// @nodoc
mixin _$TodaysGame {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get profileImageName => throw _privateConstructorUsedError;
  String get gameName => throw _privateConstructorUsedError;
  String? get gameNickname => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isMe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodaysGameCopyWith<TodaysGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodaysGameCopyWith<$Res> {
  factory $TodaysGameCopyWith(
          TodaysGame value, $Res Function(TodaysGame) then) =
      _$TodaysGameCopyWithImpl<$Res, TodaysGame>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String userName,
      String? profileImageName,
      String gameName,
      String? gameNickname,
      String createdTime,
      String? description,
      bool isMe});
}

/// @nodoc
class _$TodaysGameCopyWithImpl<$Res, $Val extends TodaysGame>
    implements $TodaysGameCopyWith<$Res> {
  _$TodaysGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? profileImageName = freezed,
    Object? gameName = null,
    Object? gameNickname = freezed,
    Object? createdTime = null,
    Object? description = freezed,
    Object? isMe = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageName: freezed == profileImageName
          ? _value.profileImageName
          : profileImageName // ignore: cast_nullable_to_non_nullable
              as String?,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameNickname: freezed == gameNickname
          ? _value.gameNickname
          : gameNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodaysGameImplCopyWith<$Res>
    implements $TodaysGameCopyWith<$Res> {
  factory _$$TodaysGameImplCopyWith(
          _$TodaysGameImpl value, $Res Function(_$TodaysGameImpl) then) =
      __$$TodaysGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String userName,
      String? profileImageName,
      String gameName,
      String? gameNickname,
      String createdTime,
      String? description,
      bool isMe});
}

/// @nodoc
class __$$TodaysGameImplCopyWithImpl<$Res>
    extends _$TodaysGameCopyWithImpl<$Res, _$TodaysGameImpl>
    implements _$$TodaysGameImplCopyWith<$Res> {
  __$$TodaysGameImplCopyWithImpl(
      _$TodaysGameImpl _value, $Res Function(_$TodaysGameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? profileImageName = freezed,
    Object? gameName = null,
    Object? gameNickname = freezed,
    Object? createdTime = null,
    Object? description = freezed,
    Object? isMe = null,
  }) {
    return _then(_$TodaysGameImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageName: freezed == profileImageName
          ? _value.profileImageName
          : profileImageName // ignore: cast_nullable_to_non_nullable
              as String?,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameNickname: freezed == gameNickname
          ? _value.gameNickname
          : gameNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodaysGameImpl implements _TodaysGame {
  _$TodaysGameImpl(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.profileImageName,
      required this.gameName,
      required this.gameNickname,
      required this.createdTime,
      required this.description,
      required this.isMe});

  factory _$TodaysGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodaysGameImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String userName;
  @override
  final String? profileImageName;
  @override
  final String gameName;
  @override
  final String? gameNickname;
  @override
  final String createdTime;
  @override
  final String? description;
  @override
  final bool isMe;

  @override
  String toString() {
    return 'TodaysGame(id: $id, userId: $userId, userName: $userName, profileImageName: $profileImageName, gameName: $gameName, gameNickname: $gameNickname, createdTime: $createdTime, description: $description, isMe: $isMe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodaysGameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profileImageName, profileImageName) ||
                other.profileImageName == profileImageName) &&
            (identical(other.gameName, gameName) ||
                other.gameName == gameName) &&
            (identical(other.gameNickname, gameNickname) ||
                other.gameNickname == gameNickname) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isMe, isMe) || other.isMe == isMe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, userName,
      profileImageName, gameName, gameNickname, createdTime, description, isMe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodaysGameImplCopyWith<_$TodaysGameImpl> get copyWith =>
      __$$TodaysGameImplCopyWithImpl<_$TodaysGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodaysGameImplToJson(
      this,
    );
  }
}

abstract class _TodaysGame implements TodaysGame {
  factory _TodaysGame(
      {required final int id,
      required final int userId,
      required final String userName,
      required final String? profileImageName,
      required final String gameName,
      required final String? gameNickname,
      required final String createdTime,
      required final String? description,
      required final bool isMe}) = _$TodaysGameImpl;

  factory _TodaysGame.fromJson(Map<String, dynamic> json) =
      _$TodaysGameImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get userName;
  @override
  String? get profileImageName;
  @override
  String get gameName;
  @override
  String? get gameNickname;
  @override
  String get createdTime;
  @override
  String? get description;
  @override
  bool get isMe;
  @override
  @JsonKey(ignore: true)
  _$$TodaysGameImplCopyWith<_$TodaysGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
