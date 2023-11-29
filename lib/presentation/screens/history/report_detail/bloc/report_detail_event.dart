part of 'report_detail_bloc.dart';

class ReportDetailEvent extends Equatable {
  const ReportDetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailReportEvent extends ReportDetailEvent {
  const GetDetailReportEvent({this.id});

  final String? id;
}
