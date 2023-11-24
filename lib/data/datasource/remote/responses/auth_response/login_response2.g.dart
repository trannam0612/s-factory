// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse2 _$LoginResponse2FromJson(Map<String, dynamic> json) =>
    LoginResponse2(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$LoginResponse2ToJson(LoginResponse2 instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
