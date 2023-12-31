import 'package:s_factory/data/datasource/remote/body/filter_list_all_production_order_body.dart';
import 'package:s_factory/data/datasource/remote/body/filter_list_report_po_body.dart';
import 'package:s_factory/data/datasource/remote/body/production_order_report_body.dart';
import 'package:s_factory/data/datasource/remote/responses/product/check_serial_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/list_all_production_orders_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/list_report_history_po_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_report_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/report_detail_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

abstract class ProductGraphQL {
  Future<DataResponse<CheckSerialResponse>?> stampCheckUniqueCode(
      Map<String, dynamic> params);

  Future<DataResponse<ProductionOrderResponse>?> factoryProductionOrderDetail(
      Map<String, dynamic> params);

  Future<DataResponse<ProductionOrderReportResponse>?>
      factoryProductionOrderReport(POReportArgs body);

  Future<DataResponse<ListAllProductionOrdersResponse>?>
      factoryAllProductionOrders(FilterListAllProductionOrderBody filter);

  Future<DataResponse<ListReportHistoryPOResponse>?> factoryPOReports(
      POReportFilterBody filter);

  Future<DataResponse<ReportDetailResponse>?> factoryPOReportDetail(
      Map<String, dynamic> params);
}
