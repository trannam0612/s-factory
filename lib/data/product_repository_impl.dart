import 'package:s_factory/data/datasource/remote/body/filter_list_all_production_order_body.dart';
import 'package:s_factory/data/datasource/remote/body/filter_list_report_po_body.dart';
import 'package:s_factory/data/datasource/remote/body/production_order_report_body.dart';
import 'package:s_factory/data/datasource/remote/product_remote_data_source%20.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/list_all_production_order_entity.dart';
import 'package:s_factory/domain/entities/product/list_report_history_po_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_report_entity.dart';
import 'package:s_factory/domain/entities/product/report_detail_entity.dart';
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

  @override
  Future<DataState<ProductionOrderReportEntity>> factoryProductionOrderReport(
    POReportArgs body,
  ) async {
    DataState<ProductionOrderReportEntity> response =
        await _productRemoteDataSource.factoryProductionOrderReport(body);
    return response;
  }

  @override
  Future<DataState<ListAllProductionOrderEntity>> factoryAllProductionOrders(
    FilterListAllProductionOrderBody body,
  ) async {
    DataState<ListAllProductionOrderEntity> response =
        await _productRemoteDataSource.factoryAllProductionOrders(body);
    return response;
  }

  @override
  Future<DataState<ListReportHistoryPOEntity>> factoryPOReports(
    POReportFilterBody body,
  ) async {
    DataState<ListReportHistoryPOEntity> response =
        await _productRemoteDataSource.factoryPOReports(body);
    return response;
  }

  @override
  Future<DataState<ReportDetailEntity>> factoryPOReportDetail(
    String id,
  ) async {
    DataState<ReportDetailEntity> response =
        await _productRemoteDataSource.factoryPOReportDetail(id);
    return response;
  }
}
