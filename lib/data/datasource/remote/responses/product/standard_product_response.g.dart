// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standard_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandardProductResponse _$StandardProductResponseFromJson(
        Map<String, dynamic> json) =>
    StandardProductResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      standard: json['standard'] as String?,
      description: json['description'] as String?,
      tool: json['tool'] as String?,
      type: json['type'] as String?,
      version: json['version'] as String?,
      reviewType: json['reviewType'] as String?,
      samples: (json['samples'] as List<dynamic>?)
          ?.map(
              (e) => SampleStandardResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      ngCount: json['ngCount'] as int?,
      result: json['result'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$StandardProductResponseToJson(
        StandardProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'standard': instance.standard,
      'description': instance.description,
      'tool': instance.tool,
      'type': instance.type,
      'version': instance.version,
      'reviewType': instance.reviewType,
      'ngCount': instance.ngCount,
      'note': instance.note,
      'result': instance.result,
      'samples': instance.samples,
    };

SampleStandardResponse _$SampleStandardResponseFromJson(
        Map<String, dynamic> json) =>
    SampleStandardResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      standard: json['standard'] as String?,
      description: json['description'] as String?,
      tool: json['tool'] as String?,
      type: json['type'] as String?,
      version: json['version'] as String?,
      reviewType: json['reviewType'] as String?,
      note: json['note'] as String?,
      result: json['result'] as String?,
      value: json['value'] as num?,
    );

Map<String, dynamic> _$SampleStandardResponseToJson(
        SampleStandardResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'standard': instance.standard,
      'description': instance.description,
      'tool': instance.tool,
      'type': instance.type,
      'version': instance.version,
      'reviewType': instance.reviewType,
      'note': instance.note,
      'value': instance.value,
      'result': instance.result,
    };
