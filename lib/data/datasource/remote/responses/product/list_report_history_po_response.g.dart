// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_report_history_po_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListReportHistoryPOResponse _$ListReportHistoryPOResponseFromJson(
        Map<String, dynamic> json) =>
    ListReportHistoryPOResponse(
      total: json['total'] as int?,
      count: json['count'] as int?,
      poReports: (json['poReports'] as List<dynamic>?)
          ?.map((e) => POReportResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListReportHistoryPOResponseToJson(
        ListReportHistoryPOResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'count': instance.count,
      'poReports': instance.poReports,
    };

POReportResponse _$POReportResponseFromJson(Map<String, dynamic> json) =>
    POReportResponse(
      id: json['id'] as String?,
      status: json['status'] as String?,
      result: json['result'] as String?,
      stampType: json['stampType'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$POReportResponseToJson(POReportResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'stampType': instance.stampType,
      'code': instance.code,
      'result': instance.result,
    };
