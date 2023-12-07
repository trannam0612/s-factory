// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_challenge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneChallegeResponse _$PhoneChallegeResponseFromJson(
        Map<String, dynamic> json) =>
    PhoneChallegeResponse(
      organization: json['organization'] as String?,
      session: json['session'] as String?,
      target: json['target'] as String?,
    );

Map<String, dynamic> _$PhoneChallegeResponseToJson(
        PhoneChallegeResponse instance) =>
    <String, dynamic>{
      'organization': instance.organization,
      'session': instance.session,
      'target': instance.target,
    };
