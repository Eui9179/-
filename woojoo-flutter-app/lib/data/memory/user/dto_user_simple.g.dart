// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_user_simple.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSimpleImpl _$$UserSimpleImplFromJson(Map<String, dynamic> json) =>
    _$UserSimpleImpl(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      profileImageName: json['profileImageName'] as String? ?? "",
    );

Map<String, dynamic> _$$UserSimpleImplToJson(_$UserSimpleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImageName': instance.profileImageName,
    };
