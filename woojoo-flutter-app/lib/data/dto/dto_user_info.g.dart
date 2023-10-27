// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      userSimple:
          UserSimple.fromJson(json['userSimple'] as Map<String, dynamic>),
      isFriend: json['isFriend'] as bool,
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
      games: (json['games'] as List<dynamic>)
          .map((e) => Game.fromJson(e as Map<String, dynamic>))
          .toList(),
      alreadyFriends: (json['alreadyFriends'] as List<dynamic>)
          .map((e) => UserInList.fromJson(e as Map<String, dynamic>))
          .toList(),
      userFriends: (json['userFriends'] as List<dynamic>)
          .map((e) => UserInList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'userSimple': instance.userSimple,
      'isFriend': instance.isFriend,
      'group': instance.group,
      'games': instance.games,
      'alreadyFriends': instance.alreadyFriends,
      'userFriends': instance.userFriends,
    };
