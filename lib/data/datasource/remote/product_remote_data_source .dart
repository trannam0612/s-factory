import 'package:s_factory/data/datasource/remote/services/product_service.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';

class ProductRemoteDataSource {
  ProductRemoteDataSource(this._productService);

  final ProductService _productService;

  Future<DataState<CheckSerialEntity>> stampCheckUniqueCode(
      String serial) async {
    final DataState<CheckSerialEntity> response =
        await _productService.stampCheckUniqueCode(serial);

    return response;
  }

  Future<DataState<ProductionOrderEntity>> factoryProductionOrderDetail(
      String poId) async {
    final DataState<ProductionOrderEntity> response =
        await _productService.factoryProductionOrderDetail(poId);

    return response;
  }
}
