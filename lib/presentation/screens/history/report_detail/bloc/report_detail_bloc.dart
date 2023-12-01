import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/report_detail_entity.dart';
import 'package:s_factory/domain/use_case/product_use_case.dart';
import 'package:s_factory/presentation/model/detail_report_model.dart';

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
      final DataState<ReportDetailEntity> dataState =
          await getIt<ProductUseCase>().factoryPOReportDetail(event.id ?? '');

      if (dataState.isSuccess()) {
        final ReportDetailModel reportDetailModel =
            ReportDetailModel.fromEntity(entity: dataState.data);
        emit(
          state.copyWith(
            reportDetailModel: reportDetailModel,
            getDetailReportState: LoadState.success,
          ),
        );
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
