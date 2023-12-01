// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_order_report_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

POReportArgs _$POReportArgsFromJson(Map<String, dynamic> json) => POReportArgs(
      poId: json['poId'] as String?,
      providerCode: json['providerCode'] as String?,
      refDocument: json['refDocument'] as String?,
      sampleSerials: (json['sampleSerials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      note: json['note'] as String?,
      ngCount: json['ngCount'] as int?,
      poStatus: json['poStatus'] as String?,
      standards: (json['standards'] as List<dynamic>?)
          ?.map((e) => Standard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$POReportArgsToJson(POReportArgs instance) =>
    <String, dynamic>{
      'poId': instance.poId,
      'providerCode': instance.providerCode,
      'refDocument': instance.refDocument,
      'sampleSerials': instance.sampleSerials,
      'note': instance.note,
      'ngCount': instance.ngCount,
      'poStatus': instance.poStatus,
      'standards': instance.standards,
    };

Standard _$StandardFromJson(Map<String, dynamic> json) => Standard(
      standardId: json['standardId'] as String?,
      sampleStandards: (json['sampleStandards'] as List<dynamic>?)
          ?.map((e) => SampleStandard.fromJson(e as Map<String, dynamic>))
          .toList(),
      result: json['result'] as String?,
      ngCount: json['ngCount'] as int?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$StandardToJson(Standard instance) => <String, dynamic>{
      'standardId': instance.standardId,
      'sampleStandards': instance.sampleStandards,
      'result': instance.result,
      'ngCount': instance.ngCount,
      'note': instance.note,
    };

SampleStandard _$SampleStandardFromJson(Map<String, dynamic> json) =>
    SampleStandard(
      serial: json['serial'] as String?,
      result: json['result'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$SampleStandardToJson(SampleStandard instance) =>
    <String, dynamic>{
      'serial': instance.serial,
      'result': instance.result,
      'value': instance.value,
      'note': instance.note,
    };
