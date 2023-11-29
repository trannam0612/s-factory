part of 'list_report_history_po_bloc.dart';

class ListReportHistoryPOState extends Equatable {
  const ListReportHistoryPOState({
    this.getListReportHistoryPOState,
    this.listReport,
    this.message,
    this.poId,
  });

  @override
  List<Object?> get props => [
        getListReportHistoryPOState,
        listReport,
        message,
        poId,
      ];

  final LoadState? getListReportHistoryPOState;
  final List<POReportModel>? listReport;
  final String? message;
  final String? poId;

  ListReportHistoryPOState copyWith({
    LoadState? getListReportHistoryPOState,
    List<POReportModel>? listReport,
    String? message,
    String? poId,
  }) {
    return ListReportHistoryPOState(
      getListReportHistoryPOState:
          getListReportHistoryPOState ?? this.getListReportHistoryPOState,
      listReport: listReport ?? this.listReport,
      message: message ?? this.message,
      poId: poId ?? this.poId,
    );
  }
}
