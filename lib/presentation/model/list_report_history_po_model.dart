import 'package:s_factory/domain/entities/product/list_report_history_po_entity.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/common/extensions/string_extension.dart';

class ListReportHistoryPOModel {
  ListReportHistoryPOModel({
    this.total,
    this.count,
    this.listProduction,
  });

  factory ListReportHistoryPOModel.fromEntity(
      {ListReportHistoryPOEntity? entity}) {
    return ListReportHistoryPOModel(
        total: entity?.total,
        count: entity?.count,
        listProduction: entity?.listProduction
            ?.map(
              (POReportEntity e) => POReportModel.fromEntity(
                entity: e,
              ),
            )
            .toList());
  }

  int? total;

  int? count;

  List<POReportModel>? listProduction;
}

class POReportModel {
  factory POReportModel.fromEntity({POReportEntity? entity}) {
    return POReportModel(
      id: entity?.id,
      status: entity?.status?.getReportStandardResult(),
      stampType: entity?.stampType,
      code: entity?.code,
    );
  }
  POReportModel({
    this.id,
    this.status,
    this.stampType,
    this.code,
  });

  final String? id;
  final ReportStandardResult? status;
  final String? stampType;
  final String? code;
}
