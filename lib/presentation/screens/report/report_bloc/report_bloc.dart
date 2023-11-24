import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/presentation/data/product_report_data.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/model/standard_product_model.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportState()) {
    on<InitListProductEvent>(_handleInitListProduct);
    on<UpdateValueProductEvent>(_handleUpdateValueProduct);
  }

  FutureOr<void> _handleInitListProduct(
      InitListProductEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(getDataListProductState: LoadState.loading));
    try {
      final List<ProductReportData> listProduct = <ProductReportData>[];
      final List<String> listSerial =
          event.productionOrder?.uniqueCodes ?? <String>[];
      final List<StandardProductModel> listStandard =
          event.productionOrder?.productType?.detailStandards ??
              <StandardProductModel>[];
      for (String element in listSerial) {
        listProduct.add(ProductReportData(serial: element));
      }
      // for (ProductReportData element in listProduct) {
      //   element = element.copyWith(listStandard: listStandard);
      //   logi(message: 'element:${element}');
      // }

      for (var i = 0; i < listProduct.length; i++) {
        listProduct[i] = listProduct[i].copyWith(listStandard: listStandard);
      }
      logi(message: 'listProduct:${listProduct}');
      emit(state.copyWith(
          listProduct: listProduct,
          getDataListProductState: LoadState.success));
    } catch (e) {
      emit(state.copyWith(getDataListProductState: LoadState.failure));
    }
  }

  FutureOr<void> _handleUpdateValueProduct(
      UpdateValueProductEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(getDataListProductState: LoadState.loading));
    try {
      final List<ProductReportData> listProduct =
          state.listProduct ?? <ProductReportData>[];
      final String? value = event.value;
      final String? serial = event.serial;
      final String? standardId = event.standardId;

      if (value != null) {
        for (ProductReportData productItem in listProduct) {
          for (StandardProductModel standardItem
              in productItem.listStandard ?? <StandardProductModel>[]) {
            if (serial == productItem.serial) {
              if (standardId == standardItem.id) {
                standardItem =
                    standardItem.copyWith(value: double.parse(value));
              }
            }
          }
        }
      }

      emit(state.copyWith(
          listProduct: listProduct,
          getDataListProductState: LoadState.success));
    } catch (e) {
      emit(state.copyWith(getDataListProductState: LoadState.failure));
    }
  }
}
