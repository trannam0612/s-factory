import 'package:s_factory/common/configs/graphql/i_graphql_client.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/data/datasource/remote/body/filter_list_all_production_order_body.dart';
import 'package:s_factory/data/datasource/remote/body/filter_list_report_po_body.dart';
import 'package:s_factory/data/datasource/remote/body/production_order_report_body.dart';
import 'package:s_factory/data/datasource/remote/graphql/product_graphql.dart';
import 'package:s_factory/data/datasource/remote/requests/product_request.dart';
import 'package:s_factory/data/datasource/remote/responses/product/check_serial_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/list_all_production_orders_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/list_report_history_po_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_report_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

class ProductGraphQLImplement extends ProductGraphQL {
  ProductGraphQLImplement(this._client);

  final IGraphQLClient _client;

  @override
  Future<DataResponse<CheckSerialResponse>?> stampCheckUniqueCode(
      Map<String, dynamic> params) async {
    final DataResponse<CheckSerialResponse>? response = await _client.query(
      ProductRequest.stampCheckUniqueCode,
      'stampCheckUniqueCode',
      vars: params,
    );
    return response;
  }

  @override
  Future<DataResponse<ProductionOrderResponse>?> factoryProductionOrderDetail(
      Map<String, dynamic> params) async {
    final DataResponse<ProductionOrderResponse>? response = await _client.query(
      ProductRequest.factoryProductionOrderDetail,
      'factoryProductionOrderDetail',
      vars: params,
    );
    return response;
  }

  @override
  Future<DataResponse<ProductionOrderReportResponse>?>
      factoryProductionOrderReport(POReportArgs body) async {
    final Map<String, dynamic> jsonBody = body.toJson();
    final Map<String, dynamic> json = {'arguments': jsonBody};
    logi(message: 'jsonBody${jsonBody}');
    final DataResponse<ProductionOrderReportResponse>? response =
        await _client.query(
      ProductRequest.factoryProductionOrderReport,
      'factoryProductionOrderReport',
      vars: json,
    );
    return response;
  }

  @override
  Future<DataResponse<ListAllProductionOrdersResponse>?>
      factoryAllProductionOrders(
          FilterListAllProductionOrderBody filter) async {
    final Map<String, dynamic> jsonBody = filter.toJson();
    final Map<String, dynamic> json = {'filter': jsonBody};
    logi(message: 'jsonBody${jsonBody}');
    final DataResponse<ListAllProductionOrdersResponse>? response =
        await _client.query(
      ProductRequest.factoryAllProductionOrders,
      'factoryAllProductionOrders',
      vars: json,
    );
    return response;
  }

  @override
  Future<DataResponse<ListReportHistoryPOResponse>?> factoryPOReports(
      POReportFilterBody filter) async {
    final Map<String, dynamic> jsonBody = filter.toJson();
    final Map<String, dynamic> json = {'filter': jsonBody};
    logi(message: 'jsonBody${jsonBody}');
    final DataResponse<ListReportHistoryPOResponse>? response =
        await _client.query(
      ProductRequest.factoryPOReports,
      'factoryPOReports',
      vars: json,
    );
    return response;
  }

  @override
  Future<DataResponse<CheckSerialResponse>?> factoryPOReportDetail(
      Map<String, dynamic> params) async {
    final DataResponse<CheckSerialResponse>? response = await _client.query(
      ProductRequest.factoryPOReportDetail,
      'factoryPOReportDetail',
      vars: params,
    );
    return response;
  }
}
