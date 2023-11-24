// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_serial_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckSerialResponse _$CheckSerialResponseFromJson(Map<String, dynamic> json) =>
    CheckSerialResponse(
      id: json['id'] as String?,
      uniqueCode: json['uniqueCode'] as String?,
      no: json['no'] as int?,
      productionAt: json['productionAt'] as int?,
      batchName: json['batchName'] as String?,
      productionOrder: json['productionOrder'] == null
          ? null
          : ProductionOrderResponse.fromJson(
              json['productionOrder'] as Map<String, dynamic>),
      productType: json['productType'] == null
          ? null
          : ProductTypeResponse.fromJson(
              json['productType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckSerialResponseToJson(
        CheckSerialResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uniqueCode': instance.uniqueCode,
      'no': instance.no,
      'productionAt': instance.productionAt,
      'batchName': instance.batchName,
      'productionOrder': instance.productionOrder,
      'productType': instance.productType,
    };
