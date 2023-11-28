import 'package:s_factory/data/datasource/remote/responses/product/list_all_production_orders_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';

class ListAllProductionOrderEntity {
  ListAllProductionOrderEntity({
    this.total,
    this.count,
    this.listProduction,
  });

  factory ListAllProductionOrderEntity.fromResponse(
      {ListAllProductionOrdersResponse? response}) {
    return ListAllProductionOrderEntity(
        total: response?.total,
        count: response?.count,
        listProduction: response?.productionOrders
            ?.map(
              (ProductionOrderResponse e) => ProductionOrderEntity.fromResponse(
                response: e,
              ),
            )
            .toList());
  }

  int? total;

  int? count;

  List<ProductionOrderEntity>? listProduction;
}
