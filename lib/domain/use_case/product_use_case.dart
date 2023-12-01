import 'package:s_factory/data/datasource/remote/body/filter_list_all_production_order_body.dart';
import 'package:s_factory/data/datasource/remote/body/filter_list_report_po_body.dart';
import 'package:s_factory/data/datasource/remote/body/production_order_report_body.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/list_all_production_order_entity.dart';
import 'package:s_factory/domain/entities/product/list_report_history_po_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_report_entity.dart';
import 'package:s_factory/domain/entities/product/report_detail_entity.dart';
import 'package:s_factory/domain/repository/product_repository.dart';

import '../entities/data_state.dart';

class ProductUseCase {
  ProductUseCase(this._productRepository);

  final ProductRepository _productRepository;

  Future<DataState<CheckSerialEntity>> stampCheckUniqueCode(
    String serial,
  ) async {
    DataState<CheckSerialEntity> entity =
        await _productRepository.stampCheckUniqueCode(
      serial,
    );
    return entity;
  }

  Future<DataState<ProductionOrderEntity>> factoryProductionOrderDetail(
    String poId,
  ) async {
    DataState<ProductionOrderEntity> entity =
        await _productRepository.factoryProductionOrderDetail(
      poId,
    );
    return entity;
  }

  Future<DataState<ProductionOrderReportEntity>> factoryProductionOrderReport(
    POReportArgs body,
  ) async {
    DataState<ProductionOrderReportEntity> entity =
        await _productRepository.factoryProductionOrderReport(
      body,
    );
    return entity;
  }

  Future<DataState<ListAllProductionOrderEntity>> factoryAllProductionOrders(
    FilterListAllProductionOrderBody body,
  ) async {
    DataState<ListAllProductionOrderEntity> entity =
        await _productRepository.factoryAllProductionOrders(
      body,
    );
    return entity;
  }

  Future<DataState<ListReportHistoryPOEntity>> factoryPOReports(
    POReportFilterBody body,
  ) async {
    DataState<ListReportHistoryPOEntity> entity =
        await _productRepository.factoryPOReports(
      body,
    );
    return entity;
  }

  Future<DataState<ReportDetailEntity>> factoryPOReportDetail(
    String id,
  ) async {
    DataState<ReportDetailEntity> entity =
        await _productRepository.factoryPOReportDetail(
      id,
    );
    return entity;
  }
}
