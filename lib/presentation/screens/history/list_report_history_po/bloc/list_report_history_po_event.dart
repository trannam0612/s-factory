part of 'list_report_history_po_bloc.dart';

class ListReportHistoryPOEvent extends Equatable {
  const ListReportHistoryPOEvent();

  @override
  List<Object> get props => [];
}

class GetListReportHistoryPOEvent extends ListReportHistoryPOEvent {
  const GetListReportHistoryPOEvent({
    this.reportCode,
    this.poId,
  });

  final String? reportCode;
  final String? poId;
}

class LoadmoreListReportHistoryPOEvent extends ListReportHistoryPOEvent {
  const LoadmoreListReportHistoryPOEvent({this.isRefresh});
  final bool? isRefresh;
}
