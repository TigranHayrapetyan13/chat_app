// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupMember _$GroupMemberFromJson(Map<String, dynamic> json) => GroupMember(
      avatarUrl: json['avatarUrl'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      isAdmin: json['isAdmin'] as bool,
    );

Map<String, dynamic> _$GroupMemberToJson(GroupMember instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'isAdmin': instance.isAdmin,
    };
