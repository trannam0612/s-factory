// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTypeResponse _$ProductTypeResponseFromJson(Map<String, dynamic> json) =>
    ProductTypeResponse(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      unitCode: json['unitCode'] as String?,
      unitName: json['unitName'] as String?,
      standardImageUrls: (json['standardImageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      detailStandards: (json['detailStandards'] as List<dynamic>?)
          ?.map((e) =>
              StandardProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      overviewStandards: (json['overviewStandards'] as List<dynamic>?)
          ?.map((e) =>
              StandardProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductTypeResponseToJson(
        ProductTypeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'unitCode': instance.unitCode,
      'unitName': instance.unitName,
      'standardImageUrls': instance.standardImageUrls,
      'detailStandards': instance.detailStandards,
      'overviewStandards': instance.overviewStandards,
    };
