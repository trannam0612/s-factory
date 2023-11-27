import 'package:s_factory/data/datasource/remote/responses/product/production_order_report_response.dart';
import 'package:s_factory/data/mapper/base_mapper.dart';
import 'package:s_factory/domain/entities/product/production_order_report_entity.dart';

class FactoryProductionOrderReportResponseMapper extends BaseMapper<
    ProductionOrderReportEntity, ProductionOrderReportResponse> {
  @override
  ProductionOrderReportEntity call(ProductionOrderReportResponse? response) {
    return ProductionOrderReportEntity.fromResponse(
      response: response,
    );
  }
}
