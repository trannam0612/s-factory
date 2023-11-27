import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/data/datasource/remote/body/production_order_report_body.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/production_order_report_entity.dart';
import 'package:s_factory/domain/use_case/product_use_case.dart';
import 'package:s_factory/presentation/data/product_report_data.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/model/standard_product_model.dart';

part 'report_event.dart';
part 'report_state.dart';

enum POStatus {
  failed(value: 'failed'),
  pass(value: 'pass'),
  processing(value: 'processing'),
  unknow(value: 'unknow');

  const POStatus({this.value});
  final String? value;
}

enum ReportStandardResult {
  fail(value: 'Fail'),
  pass(value: 'Pass'),
  unknow(value: '');

  const ReportStandardResult({this.value});
  final String? value;
}

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportState()) {
    on<InitListProductEvent>(_handleInitListProduct);
    on<UpdateValueProductEvent>(_handleUpdateValueProduct);
    on<ConfirmReportEvent>(_handleConfirmReport);
  }

  FutureOr<void> _handleInitListProduct(
      InitListProductEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(getDataListProductState: LoadState.loading));
    try {
      final List<StandardProductReportData> listProduct =
          <StandardProductReportData>[];
      final List<String> listSerial =
          event.productionOrder?.uniqueCodes ?? <String>[];
      final List<StandardProductModel> listStandard =
          event.productionOrder?.productType?.detailStandards ??
              <StandardProductModel>[];

      // for (ProductReportData element in listProduct) {
      //   element = element.copyWith(listStandard: listStandard);
      //   logi(message: 'element:${element}');
      // }

      for (int i = 0; i < listStandard.length; i++) {
        listProduct.add(StandardProductReportData(
          id: listStandard[i].id,
          name: listStandard[i].name,
          description: listStandard[i].description,
          reviewType: listStandard[i].reviewType,
          standard: listStandard[i].standard,
          tool: listStandard[i].tool,
          type: listStandard[i].type,
        ));
      }

      for (int i = 0; i < listProduct.length; i++) {
        final List<StandardValueData> listValue = <StandardValueData>[];
        for (String element in listSerial) {
          listValue.add(StandardValueData(serial: element, value: 0));

          //     .listStandardValue
          //     ?.add(StandardValueData(serial: element, value: 0));
        }
        listProduct[i] = listProduct[i].copyWith(listStandardValue: listValue);
      }

      logi(message: 'listProduct:${listProduct}');
      emit(state.copyWith(
          listSerial: listSerial,
          listProduct: listProduct,
          getDataListProductState: LoadState.success));
    } catch (e) {
      emit(state.copyWith(getDataListProductState: LoadState.failure));
    }
  }

  FutureOr<void> _handleUpdateValueProduct(
      UpdateValueProductEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(
      getDataListProductState: LoadState.loading,
      updateValueState: LoadState.loading,
    ));
    try {
      final List<StandardProductReportData> listProduct =
          state.listProduct ?? <StandardProductReportData>[];
      final ReportStandardResult? result = event.result;
      final String? value = event.value;
      final String? serial = event.serial;
      final String? standardId = event.standardId;

      if (value != null) {
        for (int i = 0; i < listProduct.length; i++) {
          StandardProductReportData productItem = listProduct[i];
          final List<StandardValueData> listStandardValue =
              productItem.listStandardValue ?? <StandardValueData>[];

          for (int j = 0; j < listStandardValue.length; j++) {
            if (standardId == productItem.id) {
              if (serial == listStandardValue[j].serial) {
                listStandardValue[j] = listStandardValue[j].copyWith(
                  value: value,
                  result: result,
                );
              }
            }
          }
        }
      }

      emit(state.copyWith(
        listProduct: listProduct,
        getDataListProductState: LoadState.success,
        updateValueState: LoadState.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        getDataListProductState: LoadState.failure,
        updateValueState: LoadState.failure,
      ));
    }
  }

  FutureOr<void> _handleConfirmReport(
      ConfirmReportEvent event, Emitter<ReportState> emit) async {
    emit(state.copyWith(confirmReportState: LoadState.loading));
    try {
      final String? providerName = event.provider;
      final String? document = event.document;
      final String? ng = event.ng;
      final String? note = event.note;
      final String? poId = event.productionOrder?.id;
      final List<String>? sampleSerials = event.productionOrder?.uniqueCodes;
      POReportArgs body = POReportArgs();
      body = body.copyWith(
        providerCode: providerName,
        refDocument: document,
        // model:,
        ngCount: int.tryParse(ng ?? '0'),
        poStatus: POStatus.pass.value, note: note, poId: poId,
        sampleSerials: sampleSerials,
        standards: state.listProduct
            ?.map(
              (StandardProductReportData e) => Standard(
                  standardId: e.id,
                  result: e.result == true
                      ? ReportStandardResult.pass.value
                      : ReportStandardResult.pass.value,
                  sampleStandards: e.listStandardValue
                      ?.map((StandardValueData e) => SampleStandard(
                            serial: e.serial,
                            result: e.result == true
                                ? ReportStandardResult.pass.value
                                : ReportStandardResult.pass.value,
                            value: e.value?.toInt(),
                          ))
                      .toList()),
            )
            .toList(),
      );

      final DataState<ProductionOrderReportEntity> dataState =
          await getIt<ProductUseCase>().factoryProductionOrderReport(body);
      if (dataState.isSuccess()) {
        emit(
          state.copyWith(
            confirmReportState: LoadState.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            confirmReportState: LoadState.failure,
            message: dataState.error,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          confirmReportState: LoadState.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
