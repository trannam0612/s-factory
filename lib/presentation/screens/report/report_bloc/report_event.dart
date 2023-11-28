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

class SelectPOStatusEvent extends ReportEvent {
  const SelectPOStatusEvent({
    this.poStatus,
  });

  final POStatus? poStatus;
}

class UpdateValueProductDetailEvent extends ReportEvent {
  const UpdateValueProductDetailEvent({
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

class UpdatePOStatusEvent extends ReportEvent {
  const UpdatePOStatusEvent({
    this.standardId,
    this.result,
  });

  final String? standardId;
  final ReportStandardResult? result;
}

class UpdateValueProductOverViewEvent extends ReportEvent {
  const UpdateValueProductOverViewEvent({
    this.ngCount,
    this.standardId,
    this.note,
    this.status,
  });

  final String? standardId;
  final String? ngCount;
  final String? note;
  final ReportStandardResult? status;
}

class ConfirmReportEvent extends ReportEvent {
  const ConfirmReportEvent({
    this.validate,
    this.provider,
    this.document,
    this.modelNumber,
    this.ng,
    this.result,
    this.note,
    this.productionOrder,
    this.reportType, //0: detail, 1: overview
  });

  final bool? validate;
  final String? provider;
  final String? document;
  final String? modelNumber;
  final String? ng;
  final String? result;
  final String? note;
  final ProductionOrderModel? productionOrder;
  final int? reportType;
}
