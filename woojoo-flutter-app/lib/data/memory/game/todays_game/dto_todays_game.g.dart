// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_todays_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodaysGameImpl _$$TodaysGameImplFromJson(Map<String, dynamic> json) =>
    _$TodaysGameImpl(
      id: json['id'] as int,
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      profileImageName: json['profileImageName'] as String?,
      gameName: json['gameName'] as String,
      gameNickname: json['gameNickname'] as String?,
      createdTime: json['createdTime'] as String,
      description: json['description'] as String?,
      isMe: json['isMe'] as bool,
    );

Map<String, dynamic> _$$TodaysGameImplToJson(_$TodaysGameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'profileImageName': instance.profileImageName,
      'gameName': instance.gameName,
      'gameNickname': instance.gameNickname,
      'createdTime': instance.createdTime,
      'description': instance.description,
      'isMe': instance.isMe,
    };
