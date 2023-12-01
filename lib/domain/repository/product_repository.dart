import 'package:s_factory/data/datasource/remote/body/filter_list_all_production_order_body.dart';
import 'package:s_factory/data/datasource/remote/body/filter_list_report_po_body.dart';
import 'package:s_factory/data/datasource/remote/body/production_order_report_body.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/list_all_production_order_entity.dart';
import 'package:s_factory/domain/entities/product/list_report_history_po_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_report_entity.dart';
import 'package:s_factory/domain/entities/product/report_detail_entity.dart';

import '../entities/data_state.dart';

abstract class ProductRepository {
  Future<DataState<CheckSerialEntity>> stampCheckUniqueCode(
    String serial,
  );

  Future<DataState<ProductionOrderEntity>> factoryProductionOrderDetail(
    String poId,
  );

  Future<DataState<ProductionOrderReportEntity>> factoryProductionOrderReport(
    POReportArgs body,
  );

  Future<DataState<ListAllProductionOrderEntity>> factoryAllProductionOrders(
    FilterListAllProductionOrderBody body,
  );
  Future<DataState<ListReportHistoryPOEntity>> factoryPOReports(
    POReportFilterBody body,
  );

  Future<DataState<ReportDetailEntity>> factoryPOReportDetail(
    String id,
  );
}
