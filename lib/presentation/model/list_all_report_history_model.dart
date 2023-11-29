import 'package:s_factory/domain/entities/product/list_all_production_order_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';

class ListAllProductionOrderModel {
  ListAllProductionOrderModel({
    this.total,
    this.count,
    this.listProduction,
  });

  factory ListAllProductionOrderModel.fromEntity(
      {ListAllProductionOrderEntity? entity}) {
    return ListAllProductionOrderModel(
        total: entity?.total,
        count: entity?.count,
        listProduction: entity?.listProduction
            ?.map(
              (ProductionOrderEntity e) => ProductionOrderModel.fromEntity(
                entity: e,
              ),
            )
            .toList());
  }

  int? total;

  int? count;

  List<ProductionOrderModel>? listProduction;
}
