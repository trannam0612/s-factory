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
    };
