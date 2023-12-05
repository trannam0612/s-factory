import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/product/product_type_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

part 'production_order_response.g.dart';

@JsonSerializable()
class ProductionOrderResponse extends BaseResponse2 {
  ProductionOrderResponse({
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
    this.productType,
    this.uniqueCodeCount,
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
  @JsonKey(name: 'uniqueCodeCount')
  final int? uniqueCodeCount;
  @JsonKey(name: 'productType')
  ProductTypeResponse? productType;

  factory ProductionOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductionOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionOrderResponseToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return ProductionOrderResponse.fromJson(json) as T;
  }
}
