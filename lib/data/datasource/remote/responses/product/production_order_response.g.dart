// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionOrderResponse _$ProductionOrderResponseFromJson(
        Map<String, dynamic> json) =>
    ProductionOrderResponse(
      id: json['id'] as String?,
      code: json['code'] as String?,
      poCode: json['poCode'] as String?,
      uniqueCodes: (json['uniqueCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productionAt: json['productionAt'] as int?,
      productionCount: json['productionCount'] as int?,
      startNo: json['startNo'] as int?,
      endNo: json['endNo'] as int?,
      status: json['status'] as String?,
      stampType: json['stampType'] as String?,
      productType: json['productType'] == null
          ? null
          : ProductTypeResponse.fromJson(
              json['productType'] as Map<String, dynamic>),
      uniqueCodeCount: json['uniqueCodeCount'] as int?,
    );

Map<String, dynamic> _$ProductionOrderResponseToJson(
        ProductionOrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'poCode': instance.poCode,
      'uniqueCodes': instance.uniqueCodes,
      'productionAt': instance.productionAt,
      'productionCount': instance.productionCount,
      'startNo': instance.startNo,
      'endNo': instance.endNo,
      'status': instance.status,
      'stampType': instance.stampType,
      'uniqueCodeCount': instance.uniqueCodeCount,
      'productType': instance.productType,
    };
