import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/data/mapper/base_mapper.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';

class FactoryProductionOrderDetailResponseMapper
    extends BaseMapper<ProductionOrderEntity, ProductionOrderResponse> {
  @override
  ProductionOrderEntity call(ProductionOrderResponse? response) {
    return ProductionOrderEntity.fromResponse(
      response: response,
    );
  }
}
