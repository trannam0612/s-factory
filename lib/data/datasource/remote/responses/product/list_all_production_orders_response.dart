import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

part 'list_all_production_orders_response.g.dart';

@JsonSerializable()
class ListAllProductionOrdersResponse extends BaseResponse2 {
  ListAllProductionOrdersResponse({
    this.total,
    this.count,
    this.productionOrders,
  });

  factory ListAllProductionOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllProductionOrdersResponseFromJson(json);
  @JsonKey(name: 'total')
  final int? total;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'productionOrders')
  final List<ProductionOrderResponse>? productionOrders;

  Map<String, dynamic> toJson() =>
      _$ListAllProductionOrdersResponseToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return ListAllProductionOrdersResponse.fromJson(json) as T;
  }
}
