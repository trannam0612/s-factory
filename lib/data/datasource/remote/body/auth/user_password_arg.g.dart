// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_password_arg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPasswordArgBody _$UserPasswordArgBodyFromJson(Map<String, dynamic> json) =>
    UserPasswordArgBody(
      newPassword: json['newPassword'] as String?,
      oldPassword: json['oldPassword'] as String?,
    );

Map<String, dynamic> _$UserPasswordArgBodyToJson(
        UserPasswordArgBody instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'oldPassword': instance.oldPassword,
    };
