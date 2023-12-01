import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
import 'package:s_factory/presentation/utils/color_constant.dart';

part 'report_event.dart';
part 'report_state.dart';

enum POStatus {
  failed(
    value: 'failed',
    title: 'Failed',
    color: ColorConstant.kSupportError2,
  ),
  pass(
    value: 'pass',
    title: 'Pass',
    color: ColorConstant.kSupportSuccess,
  ),
  processing(
    value: 'processing',
    title: 'Processing',
    color: ColorConstant.kSupportWarning,
  ),
  unknow(
    value: 'unknow',
    title: 'Unknow',
    color: ColorConstant.kTextColor,
  );

  const POStatus({
    this.value,
    this.title,
    this.color,
  });
  final String? value;
  final String? title;
  final Color? color;
}

enum ReportStandardResult {
  fail(
    value: 'Fail',
    color: ColorConstant.kSupportError2,
  ),
  pass(
    value: 'Pass',
    color: ColorConstant.kSupportSuccess,
  ),
  unknow(value: '');

  const ReportStandardResult({
    this.value,
    this.color,
  });
  final Color? color;
  final String? value;
}

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(const ReportState(currentPOStatus: POStatus.pass)) {
    on<InitListProductEvent>(_handleInitListProduct);
    on<UpdateValueProductDetailEvent>(_handleUpdateValueProduct);
    on<UpdateValueProductOverViewEvent>(_handleUpdateValueProductOverView);
    on<UpdatePOStatusEvent>(_handleUpdatePOStatus);
    on<ConfirmReportEvent>(_handleConfirmReport);
    on<SelectPOStatusEvent>(_handleSelectPOStatus);
  }
  late List<String> listSerial;
  FutureOr<void> _handleInitListProduct(
      InitListProductEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(getDataListProductState: LoadState.loading));
    try {
      final List<StandardProductReportData> listProductDetail =
          <StandardProductReportData>[];
      final List<StandardProductReportData> listProductOverView =
          <StandardProductReportData>[];
      listSerial = event.listSerial ?? <String>[];
      final List<StandardProductModel> listStandardDetail =
          event.productionOrder?.productType?.detailStandards ??
              <StandardProductModel>[];
      final List<StandardProductModel> listStandardOverView =
          event.productionOrder?.productType?.overviewStandards ??
              <StandardProductModel>[];

      for (int i = 0; i < listStandardDetail.length; i++) {
        listProductDetail.add(StandardProductReportData(
          id: listStandardDetail[i].id,
          name: listStandardDetail[i].name,
          description: listStandardDetail[i].description,
          reviewType: listStandardDetail[i].reviewType,
          standard: listStandardDetail[i].standard,
          tool: listStandardDetail[i].tool,
          type: listStandardDetail[i].type,
        ));
      }
      for (int i = 0; i < listStandardOverView.length; i++) {
        listProductOverView.add(StandardProductReportData(
            id: listStandardOverView[i].id,
            name: listStandardOverView[i].name,
            description: listStandardOverView[i].description,
            reviewType: listStandardOverView[i].reviewType,
            standard: listStandardOverView[i].standard,
            tool: listStandardOverView[i].tool,
            type: listStandardOverView[i].type,
            result: ReportStandardResult.pass));
      }

      for (int i = 0; i < listProductOverView.length; i++) {
        final List<StandardValueData> listValue = <StandardValueData>[];
        for (String element in listSerial) {
          listValue.add(StandardValueData(
            serial: element,
            // result: ReportStandardResult.pass,
          ));
        }
        listProductOverView[i] =
            listProductOverView[i].copyWith(listStandardValue: listValue);
      }
      for (int i = 0; i < listProductDetail.length; i++) {
        final List<StandardValueData> listValue = <StandardValueData>[];
        for (String element in listSerial) {
          listValue.add(StandardValueData(
            serial: element,
            // result: ReportStandardResult.pass,
          ));
        }
        listProductDetail[i] =
            listProductDetail[i].copyWith(listStandardValue: listValue);
      }

      logi(message: 'listProduct:${listProductDetail}');
      emit(state.copyWith(
        listSerial: listSerial,
        listProductDetail: listProductDetail,
        listProductOverView: listProductOverView,
        getDataListProductState: LoadState.success,
      ));
    } catch (e) {
      emit(state.copyWith(getDataListProductState: LoadState.failure));
    }
  }

  FutureOr<void> _handleUpdateValueProduct(
      UpdateValueProductDetailEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(
      getDataListProductState: LoadState.loading,
      updateDataDetailState: LoadState.loading,
    ));
    try {
      final List<StandardProductReportData> listProduct =
          state.listProductDetail ?? <StandardProductReportData>[];
      final ReportStandardResult? result = event.result;
      final String? value = event.value;
      final String? serial = event.serial;
      final String? note = event.note;
      final String? standardId = event.standardId;

      if (value != null || result != null) {
        for (int i = 0; i < listProduct.length; i++) {
          StandardProductReportData productItem = listProduct[i];
          final List<StandardValueData> listStandardValue =
              productItem.listStandardValue ?? <StandardValueData>[];

          for (int j = 0; j < listStandardValue.length; j++) {
            if (standardId == productItem.id) {
              if (serial == listStandardValue[j].serial) {
                listStandardValue[j] = listStandardValue[j].copyWith(
                  value: value != '' && value?.isNotEmpty == true
                      ? double.parse(value ?? '0')
                      : null,
                  result: result,
                  note: note,
                );
              }
            }
          }
        }
      }

      emit(state.copyWith(
        listProductDetail: listProduct,
        getDataListProductState: LoadState.success,
        updateDataDetailState: LoadState.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
        getDataListProductState: LoadState.failure,
        updateDataDetailState: LoadState.failure,
      ));
    }
  }

  FutureOr<void> _handleUpdateValueProductOverView(
      UpdateValueProductOverViewEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(
      getDataListProductState: LoadState.loading,
      updateDataOverViewState: LoadState.loading,
    ));
    try {
      final List<StandardProductReportData> listProductOverView =
          state.listProductOverView ?? <StandardProductReportData>[];
      final ReportStandardResult? result = event.status;
      final String? ngCount = event.ngCount;
      final String? note = event.note;
      final String? standardId = event.standardId;

      for (int i = 0; i < listProductOverView.length; i++) {
        if (standardId == listProductOverView[i].id) {
          if (result != null) {
            listProductOverView[i] = listProductOverView[i].copyWith(
              result: result,
            );
          }
          if (ngCount != null) {
            listProductOverView[i] = listProductOverView[i].copyWith(
              ngCount: ngCount,
            );
          }
          if (note != null) {
            listProductOverView[i] = listProductOverView[i].copyWith(
              note: note,
            );
          }
        }
      }

      emit(state.copyWith(
        listProductOverView: listProductOverView,
        getDataListProductState: LoadState.success,
        updateDataOverViewState: LoadState.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        getDataListProductState: LoadState.failure,
        updateDataOverViewState: LoadState.failure,
      ));
    }
  }

  FutureOr<void> _handleUpdatePOStatus(
      UpdatePOStatusEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(
      getDataListProductState: LoadState.loading,
      updateDataDetailState: LoadState.loading,
    ));
    try {
      final List<StandardProductReportData> listProduct =
          state.listProductDetail ?? <StandardProductReportData>[];
      final ReportStandardResult? result = event.result;
      final String? standardId = event.standardId;

      if (result != null) {
        logi(message: 'result report PO:$result');
        for (int i = 0; i < listProduct.length; i++) {
          if (standardId == listProduct[i].id) {
            listProduct[i] = listProduct[i].copyWith(result: result);
            logi(message: 'productItem:${listProduct[i]}');
          }
        }
      }

      emit(state.copyWith(
        listProductDetail: listProduct,
        getDataListProductState: LoadState.success,
        updateDataDetailState: LoadState.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        getDataListProductState: LoadState.failure,
        updateDataDetailState: LoadState.failure,
      ));
    }
  }

  FutureOr<void> _handleConfirmReport(
      ConfirmReportEvent event, Emitter<ReportState> emit) async {
    emit(state.copyWith(confirmReportState: LoadState.loading));
    if (event.validate == false) {
      emit(
        state.copyWith(
          confirmReportState: LoadState.failure,
          message: 'Vui lòng nhập đầy đủ các trường bắt buộc.',
        ),
      );
      return;
    }
    try {
      final String? providerName = event.provider;
      final String? document = event.document;
      final String? ng = event.ng;
      final String? note = event.note;
      final String? poId = event.productionOrder?.id;

      POReportArgs body = POReportArgs();
      final List<Standard> listAllStandard = <Standard>[];

      // add report detail to list
      //Chi tieets

      List<Standard>? standardsDetail = state.listProductDetail?.map(
        (StandardProductReportData e) {
          List<SampleStandard>? sampleStandards = [];
          //     e.listStandardValue?.map((StandardValueData e) {
          //   if (e.value != null || e.result != null) {
          //     return SampleStandard(
          //       serial: e.serial,
          //       result: e.result?.value,
          //       value: e.value,
          //       note: e.note,
          //     );
          //   }
          // }).toList();

          for (StandardValueData element
              in e.listStandardValue ?? <StandardValueData>[]) {
            if (element.value != null || element.result != null) {
              final double? value = element.value;
              logi(message: 'value:${value}');
              sampleStandards.add(SampleStandard(
                serial: element.serial,
                result: element.result?.value,
                value: value,
                note: element.note,
              ));
            }
          }

          return Standard(
              standardId: e.id,
              result: e.result?.value,
              ngCount: int.parse(e.ngCount ?? '0'),
              sampleStandards: sampleStandards);
        },
      ).toList();
      if (standardsDetail?.isNotEmpty == true && standardsDetail != null) {
        listAllStandard.addAll(standardsDetail);
      }
      // Tổng quan
      List<Standard>? standardsOverview = state.listProductOverView
          ?.map(
            (StandardProductReportData e) => Standard(
              standardId: e.id,
              result: e.result?.value,
              ngCount: int.tryParse(e.ngCount ?? '') ?? 0,
              note: e.note,
              sampleStandards: <SampleStandard>[],
            ),
          )
          .toList();

      if (standardsOverview?.isNotEmpty == true && standardsOverview != null) {
        listAllStandard.addAll(standardsOverview);
      }

      body = body.copyWith(
        providerCode: providerName,
        refDocument: document,
        // model:,
        ngCount: int.tryParse(ng ?? '0'),
        poStatus: state.currentPOStatus?.value, note: note, poId: poId,
        sampleSerials: listSerial,
        standards: listAllStandard,
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

  FutureOr<void> _handleSelectPOStatus(
      SelectPOStatusEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(
      currentPOStatus: event.poStatus,
    ));
  }
}
