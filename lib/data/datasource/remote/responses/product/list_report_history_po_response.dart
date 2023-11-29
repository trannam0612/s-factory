import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/product/product_type_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

part 'list_report_history_po_response.g.dart';

@JsonSerializable()
class ListReportHistoryPOResponse extends BaseResponse2 {
  ListReportHistoryPOResponse({
    this.total,
    this.count,
    this.poReports,
  });

  factory ListReportHistoryPOResponse.fromJson(Map<String, dynamic> json) =>
      _$ListReportHistoryPOResponseFromJson(json);
  @JsonKey(name: 'total')
  final int? total;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'poReports')
  final List<POReportResponse>? poReports;

  Map<String, dynamic> toJson() => _$ListReportHistoryPOResponseToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return ListReportHistoryPOResponse.fromJson(json) as T;
  }
}

@JsonSerializable()
class POReportResponse extends BaseResponse2 {
  POReportResponse({
    this.id,
    this.status,
    this.stampType,
    this.code,
  });

  factory POReportResponse.fromJson(Map<String, dynamic> json) =>
      _$POReportResponseFromJson(json);
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'stampType')
  final String? stampType;
  @JsonKey(name: 'code')
  final String? code;

  Map<String, dynamic> toJson() => _$POReportResponseToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return ListReportHistoryPOResponse.fromJson(json) as T;
  }
}
