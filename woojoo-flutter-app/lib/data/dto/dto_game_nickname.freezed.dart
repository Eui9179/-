// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto_game_nickname.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameNickname _$GameNicknameFromJson(Map<String, dynamic> json) {
  return _GameNickname.fromJson(json);
}

/// @nodoc
mixin _$GameNickname {
  String get game => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameNicknameCopyWith<GameNickname> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameNicknameCopyWith<$Res> {
  factory $GameNicknameCopyWith(
          GameNickname value, $Res Function(GameNickname) then) =
      _$GameNicknameCopyWithImpl<$Res, GameNickname>;
  @useResult
  $Res call({String game, String nickname});
}

/// @nodoc
class _$GameNicknameCopyWithImpl<$Res, $Val extends GameNickname>
    implements $GameNicknameCopyWith<$Res> {
  _$GameNicknameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? game = null,
    Object? nickname = null,
  }) {
    return _then(_value.copyWith(
      game: null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameNicknameImplCopyWith<$Res>
    implements $GameNicknameCopyWith<$Res> {
  factory _$$GameNicknameImplCopyWith(
          _$GameNicknameImpl value, $Res Function(_$GameNicknameImpl) then) =
      __$$GameNicknameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String game, String nickname});
}

/// @nodoc
class __$$GameNicknameImplCopyWithImpl<$Res>
    extends _$GameNicknameCopyWithImpl<$Res, _$GameNicknameImpl>
    implements _$$GameNicknameImplCopyWith<$Res> {
  __$$GameNicknameImplCopyWithImpl(
      _$GameNicknameImpl _value, $Res Function(_$GameNicknameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? game = null,
    Object? nickname = null,
  }) {
    return _then(_$GameNicknameImpl(
      game: null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameNicknameImpl implements _GameNickname {
  _$GameNicknameImpl({required this.game, required this.nickname});

  factory _$GameNicknameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameNicknameImplFromJson(json);

  @override
  final String game;
  @override
  final String nickname;

  @override
  String toString() {
    return 'GameNickname(game: $game, nickname: $nickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameNicknameImpl &&
            (identical(other.game, game) || other.game == game) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, game, nickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameNicknameImplCopyWith<_$GameNicknameImpl> get copyWith =>
      __$$GameNicknameImplCopyWithImpl<_$GameNicknameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameNicknameImplToJson(
      this,
    );
  }
}

abstract class _GameNickname implements GameNickname {
  factory _GameNickname(
      {required final String game,
      required final String nickname}) = _$GameNicknameImpl;

  factory _GameNickname.fromJson(Map<String, dynamic> json) =
      _$GameNicknameImpl.fromJson;

  @override
  String get game;
  @override
  String get nickname;
  @override
  @JsonKey(ignore: true)
  _$$GameNicknameImplCopyWith<_$GameNicknameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
