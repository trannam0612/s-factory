import 'package:s_factory/data/datasource/remote/responses/product/list_report_history_po_response.dart';

class ListReportHistoryPOEntity {
  ListReportHistoryPOEntity({
    this.total,
    this.count,
    this.listProduction,
  });

  factory ListReportHistoryPOEntity.fromResponse(
      {ListReportHistoryPOResponse? response}) {
    return ListReportHistoryPOEntity(
        total: response?.total,
        count: response?.count,
        listProduction: response?.poReports
            ?.map(
              (POReportResponse e) => POReportEntity.fromResponse(
                response: e,
              ),
            )
            .toList());
  }

  int? total;

  int? count;

  List<POReportEntity>? listProduction;
}

class POReportEntity {
  factory POReportEntity.fromResponse({POReportResponse? response}) {
    return POReportEntity(
      id: response?.id,
      status: response?.status,
      stampType: response?.stampType,
      code: response?.code,
      result: response?.result,
    );
  }
  POReportEntity({
    this.id,
    this.status,
    this.stampType,
    this.code,
    this.result,
  });

  final String? id;
  final String? status;
  final String? stampType;
  final String? code;
  final String? result;
}
