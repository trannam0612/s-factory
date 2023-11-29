part of 'list_report_history_bloc.dart';

class ListReportHistoryState extends Equatable {
  const ListReportHistoryState({
    this.getListReportHistoryState,
    this.listReport,
    this.message,
  });

  @override
  List<Object?> get props => [
        getListReportHistoryState,
        listReport,
        message,
      ];

  final LoadState? getListReportHistoryState;
  final List<ProductionOrderModel>? listReport;
  final String? message;

  ListReportHistoryState copyWith(
      {LoadState? getListReportHistoryState,
      List<ProductionOrderModel>? listReport,
      String? message}) {
    return ListReportHistoryState(
      getListReportHistoryState:
          getListReportHistoryState ?? this.getListReportHistoryState,
      listReport: listReport ?? this.listReport,
      message: message ?? this.message,
    );
  }
}
