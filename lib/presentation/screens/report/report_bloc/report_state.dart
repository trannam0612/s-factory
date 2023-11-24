part of 'report_bloc.dart';

class ReportState extends Equatable {
  const ReportState({
    this.listProduct,
    this.getDataListProductState,
  });

  @override
  List<Object?> get props => <Object?>[
        listProduct,
        getDataListProductState,
      ];

  final List<ProductReportData>? listProduct;
  final LoadState? getDataListProductState;

  ReportState copyWith({
    List<ProductReportData>? listProduct,
    LoadState? getDataListProductState,
  }) {
    return ReportState(
      listProduct: listProduct ?? this.listProduct,
      getDataListProductState:
          getDataListProductState ?? this.getDataListProductState,
    );
  }
}
