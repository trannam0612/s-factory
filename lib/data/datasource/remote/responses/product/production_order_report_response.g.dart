// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_order_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionOrderReportResponse _$ProductionOrderReportResponseFromJson(
        Map<String, dynamic> json) =>
    ProductionOrderReportResponse(
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
      providerCode: json['providerCode'] as String?,
      refDocument: json['refDocument'] as String?,
      sampleCount: json['sampleCount'] as int?,
      note: json['note'] as String?,
      ngCount: json['ngCount'] as int?,
    );

Map<String, dynamic> _$ProductionOrderReportResponseToJson(
        ProductionOrderReportResponse instance) =>
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
      'providerCode': instance.providerCode,
      'refDocument': instance.refDocument,
      'sampleCount': instance.sampleCount,
      'note': instance.note,
      'ngCount': instance.ngCount,
    };
