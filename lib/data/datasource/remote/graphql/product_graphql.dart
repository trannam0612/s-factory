import 'package:s_factory/data/datasource/remote/responses/product/check_serial_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

abstract class ProductGraphQL {
  Future<DataResponse<CheckSerialResponse>?> stampCheckUniqueCode(
      Map<String, dynamic> params);

  Future<DataResponse<ProductionOrderResponse>?> factoryProductionOrderDetail(
      Map<String, dynamic> params);
}
