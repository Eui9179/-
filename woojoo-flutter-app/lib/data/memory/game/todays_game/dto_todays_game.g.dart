// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_todays_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodaysGameImpl _$$TodaysGameImplFromJson(Map<String, dynamic> json) =>
    _$TodaysGameImpl(
      id: json['todays_game_id'] as int,
      userId: json['id'] as int,
      userName: json['name'] as String,
      profileImageName: json['profile_image_name'] as String?,
      gameName: json['game'] as String,
      gameNickname: json['game_nickname'] as String?,
      createdTime: json['create_time'] as String,
      description: json['introduction'] as String?,
      isMe: json['isme'] as bool,
    );

Map<String, dynamic> _$$TodaysGameImplToJson(_$TodaysGameImpl instance) =>
    <String, dynamic>{
      'todays_game_id': instance.id,
      'id': instance.userId,
      'name': instance.userName,
      'profile_image_name': instance.profileImageName,
      'game': instance.gameName,
      'game_nickname': instance.gameNickname,
      'create_time': instance.createdTime,
      'introduction': instance.description,
      'isme': instance.isMe,
    };
