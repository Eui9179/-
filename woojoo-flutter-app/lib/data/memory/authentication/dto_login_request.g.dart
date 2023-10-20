// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      phoneNumber: json['phone_number'] as String,
      fcm: json['fcm_token'] as String,
      verificationCode: json['sms_code'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'fcm_token': instance.fcm,
      'sms_code': instance.verificationCode,
    };
