// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      phoneNumber: json['phoneNumber'] as String,
      fcmToken: json['fcmToken'] as String,
      smsCode: json['smsCode'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'fcmToken': instance.fcmToken,
      'smsCode': instance.smsCode,
    };
