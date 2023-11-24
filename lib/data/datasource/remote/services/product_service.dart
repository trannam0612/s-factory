import 'package:s_factory/data/datasource/remote/graphql/product_graphql.dart';
import 'package:s_factory/data/datasource/remote/responses/product/check_serial_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';
import 'package:s_factory/data/datasource/remote/services/base_service.dart';
import 'package:s_factory/data/mapper/product/check_serial_response_mapper.dart';
import 'package:s_factory/data/mapper/product/factory_production_order_detail_response_mapper.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';

import '../../../../domain/entities/data_state.dart';

class ProductService with ConvertAbleDataState {
  ProductService(this._api);

  final ProductGraphQL _api;

  Future<DataState<CheckSerialEntity>> stampCheckUniqueCode(
    String serial,
  ) async {
    try {
      final DataResponse<CheckSerialResponse>? response =
          await _api.stampCheckUniqueCode(<String, String>{
        'serial': serial,
      });

      return convertToDataState<CheckSerialEntity, CheckSerialResponse>(
          response, CheckSerialResponseMapper());
    } catch (error) {
      return DataFailed<CheckSerialEntity>(
        error.toString(),
      );
    }
  }

  Future<DataState<ProductionOrderEntity>> factoryProductionOrderDetail(
    String poId,
  ) async {
    try {
      final DataResponse<ProductionOrderResponse>? response =
          await _api.factoryProductionOrderDetail(<String, String>{
        'id': poId,
      });

      return convertToDataState<ProductionOrderEntity, ProductionOrderResponse>(
          response, FactoryProductionOrderDetailResponseMapper());
    } catch (error) {
      return DataFailed<ProductionOrderEntity>(
        error.toString(),
      );
    }
  }
}
