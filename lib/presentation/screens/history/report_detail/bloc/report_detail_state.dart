part of 'report_detail_bloc.dart';

class ReportDetailState extends Equatable {
  const ReportDetailState({
    this.getDetailReportState,
    this.message,
  });

  @override
  List<Object?> get props => [
        getDetailReportState,
        message,
      ];

  final LoadState? getDetailReportState;
  final String? message;

  ReportDetailState copyWith({
    LoadState? getDetailReportState,
    String? message,
  }) {
    return ReportDetailState(
      getDetailReportState: getDetailReportState ?? this.getDetailReportState,
      message: message ?? this.message,
    );
  }
}
