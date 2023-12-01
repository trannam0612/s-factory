part of 'report_detail_bloc.dart';

class ReportDetailState extends Equatable {
  const ReportDetailState({
    this.getDetailReportState,
    this.message,
    this.reportDetailModel,
  });

  @override
  List<Object?> get props => [
        getDetailReportState,
        message,
      ];

  final LoadState? getDetailReportState;
  final ReportDetailModel? reportDetailModel;
  final String? message;

  ReportDetailState copyWith({
    LoadState? getDetailReportState,
    ReportDetailModel? reportDetailModel,
    String? message,
  }) {
    return ReportDetailState(
      getDetailReportState: getDetailReportState ?? this.getDetailReportState,
      message: message ?? this.message,
      reportDetailModel: reportDetailModel ?? this.reportDetailModel,
    );
  }
}
