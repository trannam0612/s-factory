import 'package:s_factory/data/datasource/remote/responses/product/list_all_production_orders_response.dart';
import 'package:s_factory/data/mapper/base_mapper.dart';
import 'package:s_factory/domain/entities/product/list_all_production_order_entity.dart';

class ListAllProductionOrderResponseMapper extends BaseMapper<
    ListAllProductionOrderEntity, ListAllProductionOrdersResponse> {
  @override
  ListAllProductionOrderEntity call(ListAllProductionOrdersResponse? response) {
    return ListAllProductionOrderEntity.fromResponse(
      response: response,
    );
  }
}
