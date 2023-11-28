import 'package:s_factory/data/datasource/remote/body/filter_list_all_production_order_body.dart';
import 'package:s_factory/data/datasource/remote/body/production_order_report_body.dart';
import 'package:s_factory/data/datasource/remote/graphql/product_graphql.dart';
import 'package:s_factory/data/datasource/remote/responses/product/check_serial_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/list_all_production_orders_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_report_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';
import 'package:s_factory/data/datasource/remote/services/base_service.dart';
import 'package:s_factory/data/mapper/product/check_serial_response_mapper.dart';
import 'package:s_factory/data/mapper/product/factory_production_order_detail_response_mapper.dart';
import 'package:s_factory/data/mapper/product/factory_production_order_report_response_mapper.dart';
import 'package:s_factory/data/mapper/product/list_all_production_order_response_mapper.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/list_all_production_order_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_report_entity.dart';

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

  Future<DataState<ProductionOrderReportEntity>> factoryProductionOrderReport(
    POReportArgs body,
  ) async {
    try {
      final DataResponse<ProductionOrderReportResponse>? response =
          await _api.factoryProductionOrderReport(body);

      return convertToDataState<ProductionOrderReportEntity,
              ProductionOrderReportResponse>(
          response, FactoryProductionOrderReportResponseMapper());
    } catch (error) {
      return DataFailed<ProductionOrderReportEntity>(
        error.toString(),
      );
    }
  }

  Future<DataState<ListAllProductionOrderEntity>> factoryAllProductionOrders(
    FilterListAllProductionOrderBody body,
  ) async {
    try {
      final DataResponse<ListAllProductionOrdersResponse>? response =
          await _api.factoryAllProductionOrders(body);

      return convertToDataState<ListAllProductionOrderEntity,
              ListAllProductionOrdersResponse>(
          response, ListAllProductionOrderResponseMapper());
    } catch (error) {
      return DataFailed<ListAllProductionOrderEntity>(
        error.toString(),
      );
    }
  }
}
