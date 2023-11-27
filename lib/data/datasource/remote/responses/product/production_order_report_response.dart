import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/product/product_type_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

part 'production_order_report_response.g.dart';

@JsonSerializable()
class ProductionOrderReportResponse extends BaseResponse2 {
  ProductionOrderReportResponse({
    this.id,
    this.code,
    this.poCode,
    this.uniqueCodes,
    this.productionAt,
    this.productionCount,
    this.startNo,
    this.endNo,
    this.status,
    this.stampType,
    this.providerCode,
    this.refDocument,
    this.sampleCount,
    this.note,
    this.ngCount,
  });
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'poCode')
  String? poCode;
  @JsonKey(name: 'uniqueCodes')
  List<String>? uniqueCodes;
  @JsonKey(name: 'productionAt')
  final int? productionAt;
  @JsonKey(name: 'productionCount')
  final int? productionCount;
  @JsonKey(name: 'startNo')
  final int? startNo;
  @JsonKey(name: 'endNo')
  final int? endNo;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'stampType')
  final String? stampType;
  @JsonKey(name: 'providerCode')
  final String? providerCode;
  @JsonKey(name: 'refDocument')
  final String? refDocument;
  @JsonKey(name: 'sampleCount')
  final int? sampleCount;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'ngCount')
  final int? ngCount;

  factory ProductionOrderReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductionOrderReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionOrderReportResponseToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return ProductionOrderReportResponse.fromJson(json) as T;
  }
}
