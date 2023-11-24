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
  });

  final String? standardId;
  final String? serial;
  final String? value;
}
