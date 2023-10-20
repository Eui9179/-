// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      name: json['game'] as String,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'game': instance.name,
      'nickname': instance.nickname,
    };
