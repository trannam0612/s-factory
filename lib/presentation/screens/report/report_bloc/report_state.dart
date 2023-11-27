part of 'report_bloc.dart';

class ReportState extends Equatable {
  const ReportState({
    this.listProduct,
    this.getDataListProductState,
    this.updateValueState,
    this.confirmReportState,
    this.listSerial,
    this.message,
  });

  @override
  List<Object?> get props => <Object?>[
        listProduct,
        getDataListProductState,
        confirmReportState,
        updateValueState,
        listSerial,
        message,
      ];

  final List<StandardProductReportData>? listProduct;
  final LoadState? getDataListProductState;
  final LoadState? confirmReportState;
  final LoadState? updateValueState;
  final List<String>? listSerial;
  final String? message;

  ReportState copyWith({
    List<StandardProductReportData>? listProduct,
    LoadState? getDataListProductState,
    LoadState? updateValueState,
    LoadState? confirmReportState,
    List<String>? listSerial,
    String? message,
  }) {
    return ReportState(
      listProduct: listProduct ?? this.listProduct,
      listSerial: listSerial ?? this.listSerial,
      updateValueState: updateValueState ?? this.updateValueState,
      confirmReportState: confirmReportState ?? this.confirmReportState,
      getDataListProductState:
          getDataListProductState ?? this.getDataListProductState,
      message: message ?? this.message,
    );
  }
}
