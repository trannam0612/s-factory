// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_list_report_po_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

POReportFilterBody _$POReportFilterBodyFromJson(Map<String, dynamic> json) =>
    POReportFilterBody(
      poIkeyword: json['keyword'] as String?,
      page: json['page'] as int?,
      size: json['size'] as int?,
      poId: json['poId'] as String?,
    );

Map<String, dynamic> _$POReportFilterBodyToJson(POReportFilterBody instance) =>
    <String, dynamic>{
      'keyword': instance.poIkeyword,
      'page': instance.page,
      'size': instance.size,
      'poId': instance.poId,
    };
