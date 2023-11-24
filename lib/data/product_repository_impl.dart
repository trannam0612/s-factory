import 'package:s_factory/data/datasource/remote/product_remote_data_source%20.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';
import 'package:s_factory/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl(this._productRemoteDataSource);
  final ProductRemoteDataSource _productRemoteDataSource;

  @override
  Future<DataState<CheckSerialEntity>> stampCheckUniqueCode(
    String serial,
  ) async {
    DataState<CheckSerialEntity> response =
        await _productRemoteDataSource.stampCheckUniqueCode(serial);
    return response;
  }

  @override
  Future<DataState<ProductionOrderEntity>> factoryProductionOrderDetail(
    String poId,
  ) async {
    DataState<ProductionOrderEntity> response =
        await _productRemoteDataSource.factoryProductionOrderDetail(poId);
    return response;
  }
}
