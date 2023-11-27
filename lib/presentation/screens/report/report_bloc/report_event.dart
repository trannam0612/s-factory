part of 'report_bloc.dart';

class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class InitListProductEvent extends ReportEvent {
  const InitListProductEvent({
    this.productionOrder,
  });

  final ProductionOrderModel? productionOrder;
}

class UpdateValueProductEvent extends ReportEvent {
  const UpdateValueProductEvent({
    this.value,
    this.serial,
    this.standardId,
    this.result,
  });

  final String? standardId;
  final String? serial;
  final String? value;
  final ReportStandardResult? result;
}

class ConfirmReportEvent extends ReportEvent {
  const ConfirmReportEvent({
    this.provider,
    this.document,
    this.modelNumber,
    this.ng,
    this.result,
    this.note,
    this.productionOrder,
  });

  final String? provider;
  final String? document;
  final String? modelNumber;
  final String? ng;
  final String? result;
  final String? note;
  final ProductionOrderModel? productionOrder;
}
