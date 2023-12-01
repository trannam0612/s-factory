import 'package:s_factory/data/datasource/remote/body/filter_list_all_production_order_body.dart';
import 'package:s_factory/data/datasource/remote/body/filter_list_report_po_body.dart';
import 'package:s_factory/data/datasource/remote/body/production_order_report_body.dart';
import 'package:s_factory/data/datasource/remote/services/product_service.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/list_all_production_order_entity.dart';
import 'package:s_factory/domain/entities/product/list_report_history_po_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_report_entity.dart';
import 'package:s_factory/domain/entities/product/report_detail_entity.dart';

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

  Future<DataState<ProductionOrderReportEntity>> factoryProductionOrderReport(
      POReportArgs body) async {
    final DataState<ProductionOrderReportEntity> response =
        await _productService.factoryProductionOrderReport(body);

    return response;
  }

  Future<DataState<ListAllProductionOrderEntity>> factoryAllProductionOrders(
      FilterListAllProductionOrderBody body) async {
    final DataState<ListAllProductionOrderEntity> response =
        await _productService.factoryAllProductionOrders(body);

    return response;
  }

  Future<DataState<ListReportHistoryPOEntity>> factoryPOReports(
      POReportFilterBody body) async {
    final DataState<ListReportHistoryPOEntity> response =
        await _productService.factoryPOReports(body);

    return response;
  }

  Future<DataState<ReportDetailEntity>> factoryPOReportDetail(String id) async {
    final DataState<ReportDetailEntity> response =
        await _productService.factoryPOReportDetail(id);

    return response;
  }
}
