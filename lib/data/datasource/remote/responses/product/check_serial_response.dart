import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/product/product_type_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

part 'check_serial_response.g.dart';

@JsonSerializable()
class CheckSerialResponse extends BaseResponse2 {
  CheckSerialResponse({
    this.id,
    this.uniqueCode,
    this.no,
    this.productionAt,
    this.batchName,
    this.productionOrder,
    this.productType,
  });

  factory CheckSerialResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckSerialResponseFromJson(json);
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'uniqueCode')
  String? uniqueCode;
  @JsonKey(name: 'no')
  int? no;
  @JsonKey(name: 'productionAt')
  int? productionAt;
  @JsonKey(name: 'batchName')
  String? batchName;
  @JsonKey(name: 'productionOrder')
  ProductionOrderResponse? productionOrder;
  @JsonKey(name: 'productType')
  ProductTypeResponse? productType;

  Map<String, dynamic> toJson() => _$CheckSerialResponseToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return CheckSerialResponse.fromJson(json) as T;
  }
}
