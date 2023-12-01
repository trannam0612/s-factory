// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDetailResponse _$ReportDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ReportDetailResponse(
      id: json['id'] as String?,
      code: json['code'] as String?,
      poCode: json['poCode'] as String?,
      createdAt: json['createdAt'] as int?,
      uniqueCodes: (json['uniqueCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productionAt: json['productionAt'] as int?,
      productionCount: json['productionCount'] as int?,
      startNo: json['startNo'] as int?,
      endNo: json['endNo'] as int?,
      owner: json['owner'] == null
          ? null
          : UserResponse.fromJson(json['owner'] as Map<String, dynamic>),
      status: json['status'] as String?,
      stampType: json['stampType'] as String?,
      productType: json['productType'] == null
          ? null
          : ProductTypeResponse.fromJson(
              json['productType'] as Map<String, dynamic>),
      detailStandards: (json['detailStandards'] as List<dynamic>?)
          ?.map((e) =>
              StandardProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      overviewStandards: (json['overviewStandards'] as List<dynamic>?)
          ?.map((e) =>
              StandardProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..providerCode = json['providerCode'] as String?
      ..refDocument = json['refDocument'] as String?
      ..ngCount = json['ngCount'] as int?
      ..note = json['note'] as String?
      ..sampleSerials = (json['sampleSerials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$ReportDetailResponseToJson(
        ReportDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'poCode': instance.poCode,
      'createdAt': instance.createdAt,
      'providerCode': instance.providerCode,
      'refDocument': instance.refDocument,
      'ngCount': instance.ngCount,
      'note': instance.note,
      'uniqueCodes': instance.uniqueCodes,
      'sampleSerials': instance.sampleSerials,
      'productionAt': instance.productionAt,
      'productionCount': instance.productionCount,
      'startNo': instance.startNo,
      'endNo': instance.endNo,
      'status': instance.status,
      'stampType': instance.stampType,
      'productType': instance.productType,
      'owner': instance.owner,
      'detailStandards': instance.detailStandards,
      'overviewStandards': instance.overviewStandards,
    };
