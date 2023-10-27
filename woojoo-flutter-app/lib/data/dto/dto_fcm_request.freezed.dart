// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto_fcm_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FcmRequest _$FcmRequestFromJson(Map<String, dynamic> json) {
  return _FcmRequest.fromJson(json);
}

/// @nodoc
mixin _$FcmRequest {
  String get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FcmRequestCopyWith<FcmRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmRequestCopyWith<$Res> {
  factory $FcmRequestCopyWith(
          FcmRequest value, $Res Function(FcmRequest) then) =
      _$FcmRequestCopyWithImpl<$Res, FcmRequest>;
  @useResult
  $Res call({String fcmToken});
}

/// @nodoc
class _$FcmRequestCopyWithImpl<$Res, $Val extends FcmRequest>
    implements $FcmRequestCopyWith<$Res> {
  _$FcmRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
  }) {
    return _then(_value.copyWith(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FcmRequestImplCopyWith<$Res>
    implements $FcmRequestCopyWith<$Res> {
  factory _$$FcmRequestImplCopyWith(
          _$FcmRequestImpl value, $Res Function(_$FcmRequestImpl) then) =
      __$$FcmRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fcmToken});
}

/// @nodoc
class __$$FcmRequestImplCopyWithImpl<$Res>
    extends _$FcmRequestCopyWithImpl<$Res, _$FcmRequestImpl>
    implements _$$FcmRequestImplCopyWith<$Res> {
  __$$FcmRequestImplCopyWithImpl(
      _$FcmRequestImpl _value, $Res Function(_$FcmRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
  }) {
    return _then(_$FcmRequestImpl(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FcmRequestImpl implements _FcmRequest {
  _$FcmRequestImpl({required this.fcmToken});

  factory _$FcmRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FcmRequestImplFromJson(json);

  @override
  final String fcmToken;

  @override
  String toString() {
    return 'FcmRequest(fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FcmRequestImpl &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FcmRequestImplCopyWith<_$FcmRequestImpl> get copyWith =>
      __$$FcmRequestImplCopyWithImpl<_$FcmRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FcmRequestImplToJson(
      this,
    );
  }
}

abstract class _FcmRequest implements FcmRequest {
  factory _FcmRequest({required final String fcmToken}) = _$FcmRequestImpl;

  factory _FcmRequest.fromJson(Map<String, dynamic> json) =
      _$FcmRequestImpl.fromJson;

  @override
  String get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$FcmRequestImplCopyWith<_$FcmRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
