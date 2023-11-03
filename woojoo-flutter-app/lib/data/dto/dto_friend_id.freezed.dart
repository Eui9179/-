// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto_friend_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendId _$FriendIdFromJson(Map<String, dynamic> json) {
  return _FriendId.fromJson(json);
}

/// @nodoc
mixin _$FriendId {
  int get friendId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendIdCopyWith<FriendId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendIdCopyWith<$Res> {
  factory $FriendIdCopyWith(FriendId value, $Res Function(FriendId) then) =
      _$FriendIdCopyWithImpl<$Res, FriendId>;
  @useResult
  $Res call({int friendId});
}

/// @nodoc
class _$FriendIdCopyWithImpl<$Res, $Val extends FriendId>
    implements $FriendIdCopyWith<$Res> {
  _$FriendIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendId = null,
  }) {
    return _then(_value.copyWith(
      friendId: null == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendIdImplCopyWith<$Res>
    implements $FriendIdCopyWith<$Res> {
  factory _$$FriendIdImplCopyWith(
          _$FriendIdImpl value, $Res Function(_$FriendIdImpl) then) =
      __$$FriendIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int friendId});
}

/// @nodoc
class __$$FriendIdImplCopyWithImpl<$Res>
    extends _$FriendIdCopyWithImpl<$Res, _$FriendIdImpl>
    implements _$$FriendIdImplCopyWith<$Res> {
  __$$FriendIdImplCopyWithImpl(
      _$FriendIdImpl _value, $Res Function(_$FriendIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendId = null,
  }) {
    return _then(_$FriendIdImpl(
      null == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendIdImpl implements _FriendId {
  _$FriendIdImpl(this.friendId);

  factory _$FriendIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendIdImplFromJson(json);

  @override
  final int friendId;

  @override
  String toString() {
    return 'FriendId(friendId: $friendId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendIdImpl &&
            (identical(other.friendId, friendId) ||
                other.friendId == friendId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, friendId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendIdImplCopyWith<_$FriendIdImpl> get copyWith =>
      __$$FriendIdImplCopyWithImpl<_$FriendIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendIdImplToJson(
      this,
    );
  }
}

abstract class _FriendId implements FriendId {
  factory _FriendId(final int friendId) = _$FriendIdImpl;

  factory _FriendId.fromJson(Map<String, dynamic> json) =
      _$FriendIdImpl.fromJson;

  @override
  int get friendId;
  @override
  @JsonKey(ignore: true)
  _$$FriendIdImplCopyWith<_$FriendIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
