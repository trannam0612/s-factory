part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.checkSerialState,
    this.listProductModel,
    this.confirmReportState,
    this.productionOrderModel,
    this.message,
  });

  final LoadState? checkSerialState;

  final List<ProductModel>? listProductModel;

  final LoadState? confirmReportState;
  final ProductionOrderModel? productionOrderModel;

  final String? message;

  HomeState copyWith({
    LoadState? checkSerialState,
    List<ProductModel>? listProductModel,
    LoadState? confirmReportState,
    ProductionOrderModel? productionOrderModel,
    String? message,
  }) {
    return HomeState(
      checkSerialState: checkSerialState ?? this.checkSerialState,
      listProductModel: listProductModel ?? this.listProductModel,
      confirmReportState: confirmReportState ?? this.confirmReportState,
      productionOrderModel: productionOrderModel ?? this.productionOrderModel,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[
        checkSerialState,
        listProductModel,
        confirmReportState,
        productionOrderModel,
        message,
      ];
}
