// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto_user_simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSimple _$UserSimpleFromJson(Map<String, dynamic> json) {
  return _UserSimple.fromJson(json);
}

/// @nodoc
mixin _$UserSimple {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_name')
  String? get profileImageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_name')
  set profileImageName(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSimpleCopyWith<UserSimple> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSimpleCopyWith<$Res> {
  factory $UserSimpleCopyWith(
          UserSimple value, $Res Function(UserSimple) then) =
      _$UserSimpleCopyWithImpl<$Res, UserSimple>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'profile_image_name') String? profileImageName});
}

/// @nodoc
class _$UserSimpleCopyWithImpl<$Res, $Val extends UserSimple>
    implements $UserSimpleCopyWith<$Res> {
  _$UserSimpleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageName: freezed == profileImageName
          ? _value.profileImageName
          : profileImageName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSimpleImplCopyWith<$Res>
    implements $UserSimpleCopyWith<$Res> {
  factory _$$UserSimpleImplCopyWith(
          _$UserSimpleImpl value, $Res Function(_$UserSimpleImpl) then) =
      __$$UserSimpleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'profile_image_name') String? profileImageName});
}

/// @nodoc
class __$$UserSimpleImplCopyWithImpl<$Res>
    extends _$UserSimpleCopyWithImpl<$Res, _$UserSimpleImpl>
    implements _$$UserSimpleImplCopyWith<$Res> {
  __$$UserSimpleImplCopyWithImpl(
      _$UserSimpleImpl _value, $Res Function(_$UserSimpleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageName = freezed,
  }) {
    return _then(_$UserSimpleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageName: freezed == profileImageName
          ? _value.profileImageName
          : profileImageName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSimpleImpl implements _UserSimple {
  _$UserSimpleImpl(
      {this.id = 0,
      this.name = "",
      @JsonKey(name: 'profile_image_name') this.profileImageName = ""});

  factory _$UserSimpleImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSimpleImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey(name: 'profile_image_name')
  String? profileImageName;

  @override
  String toString() {
    return 'UserSimple(id: $id, name: $name, profileImageName: $profileImageName)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSimpleImplCopyWith<_$UserSimpleImpl> get copyWith =>
      __$$UserSimpleImplCopyWithImpl<_$UserSimpleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSimpleImplToJson(
      this,
    );
  }
}

abstract class _UserSimple implements UserSimple {
  factory _UserSimple(
          {final int id,
          String name,
          @JsonKey(name: 'profile_image_name') String? profileImageName}) =
      _$UserSimpleImpl;

  factory _UserSimple.fromJson(Map<String, dynamic> json) =
      _$UserSimpleImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  set name(String value);
  @override
  @JsonKey(name: 'profile_image_name')
  String? get profileImageName;
  @JsonKey(name: 'profile_image_name')
  set profileImageName(String? value);
  @override
  @JsonKey(ignore: true)
  _$$UserSimpleImplCopyWith<_$UserSimpleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
