part of 'list_report_history_bloc.dart';

class ListReportHistoryEvent extends Equatable {
  const ListReportHistoryEvent();

  @override
  List<Object> get props => [];
}

class GetListReportHistoryEvent extends ListReportHistoryEvent {
  const GetListReportHistoryEvent({this.pOCode});

  final String? pOCode;
}

class LoadmoreListReportHistoryEvent extends ListReportHistoryEvent {
  const LoadmoreListReportHistoryEvent({this.isRefresh});
  final bool? isRefresh;
}
