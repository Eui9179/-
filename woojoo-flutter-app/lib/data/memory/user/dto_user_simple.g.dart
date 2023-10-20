// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_user_simple.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSimpleImpl _$$UserSimpleImplFromJson(Map<String, dynamic> json) =>
    _$UserSimpleImpl(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      profileImageName: json['profile_image_name'] as String? ?? "",
    );

Map<String, dynamic> _$$UserSimpleImplToJson(_$UserSimpleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_image_name': instance.profileImageName,
    };
