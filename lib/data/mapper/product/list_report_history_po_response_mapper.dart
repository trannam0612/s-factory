import 'package:s_factory/data/datasource/remote/responses/product/list_all_production_orders_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/list_report_history_po_response.dart';
import 'package:s_factory/data/mapper/base_mapper.dart';
import 'package:s_factory/domain/entities/product/list_all_production_order_entity.dart';
import 'package:s_factory/domain/entities/product/list_report_history_po_entity.dart';

class ListReportHistoryPOResponseMapper
    extends BaseMapper<ListReportHistoryPOEntity, ListReportHistoryPOResponse> {
  @override
  ListReportHistoryPOEntity call(ListReportHistoryPOResponse? response) {
    return ListReportHistoryPOEntity.fromResponse(
      response: response,
    );
  }
}
