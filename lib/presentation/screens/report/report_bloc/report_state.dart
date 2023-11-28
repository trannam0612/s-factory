part of 'report_bloc.dart';

class ReportState extends Equatable {
  const ReportState({
    this.listProductDetail,
    this.listProductOverView,
    this.getDataListProductState,
    this.updateDataDetailState,
    this.updateDataOverViewState,
    this.confirmReportState,
    this.listSerial,
    this.currentPOStatus,
    this.message,
  });

  @override
  List<Object?> get props => <Object?>[
        listProductDetail,
        listProductOverView,
        getDataListProductState,
        confirmReportState,
        updateDataDetailState,
        updateDataOverViewState,
        listSerial,
        currentPOStatus,
        message,
      ];

  final List<StandardProductReportData>? listProductDetail;
  final List<StandardProductReportData>? listProductOverView;
  final LoadState? getDataListProductState;
  final LoadState? confirmReportState;
  final LoadState? updateDataDetailState;
  final LoadState? updateDataOverViewState;
  final List<String>? listSerial;
  final POStatus? currentPOStatus;
  final String? message;

  ReportState copyWith({
    List<StandardProductReportData>? listProductDetail,
    List<StandardProductReportData>? listProductOverView,
    LoadState? getDataListProductState,
    LoadState? updateDataDetailState,
    LoadState? updateDataOverViewState,
    LoadState? confirmReportState,
    List<String>? listSerial,
    POStatus? currentPOStatus,
    String? message,
  }) {
    return ReportState(
      listProductDetail: listProductDetail ?? this.listProductDetail,
      listProductOverView: listProductOverView ?? this.listProductOverView,
      listSerial: listSerial ?? this.listSerial,
      updateDataDetailState:
          updateDataDetailState ?? this.updateDataDetailState,
      updateDataOverViewState:
          updateDataOverViewState ?? this.updateDataOverViewState,
      confirmReportState: confirmReportState ?? this.confirmReportState,
      getDataListProductState:
          getDataListProductState ?? this.getDataListProductState,
      currentPOStatus: currentPOStatus ?? this.currentPOStatus,
      message: message ?? this.message,
    );
  }
}
