import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/use_case/product_use_case.dart';

part 'report_detail_event.dart';
part 'report_detail_state.dart';

class ReportDetailBloc extends Bloc<ReportDetailEvent, ReportDetailState> {
  ReportDetailBloc() : super(const ReportDetailState()) {
    on<GetDetailReportEvent>(_handleGetDetailEvent);
  }

  FutureOr<void> _handleGetDetailEvent(
      GetDetailReportEvent event, Emitter<ReportDetailState> emit) async {
    emit(state.copyWith(getDetailReportState: LoadState.loading));
    try {
      final DataState<CheckSerialEntity> dataState =
          await getIt<ProductUseCase>().factoryPOReportDetail('serial');
      if (dataState.isSuccess()) {
        emit(state.copyWith(
          getDetailReportState: LoadState.success,
        ));
      } else {
        emit(state.copyWith(
          getDetailReportState: LoadState.failure,
          message: dataState.error,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getDetailReportState: LoadState.failure,
        message: e.toString(),
      ));
    }
  }
}
