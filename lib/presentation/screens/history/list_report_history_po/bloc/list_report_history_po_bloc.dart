import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/data/datasource/remote/body/filter_list_report_po_body.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/list_report_history_po_entity.dart';
import 'package:s_factory/domain/use_case/product_use_case.dart';
import 'package:s_factory/presentation/model/list_report_history_po_model.dart';

part 'list_report_history_po_event.dart';
part 'list_report_history_po_state.dart';

class ListReportHistoryPOBloc
    extends Bloc<ListReportHistoryPOEvent, ListReportHistoryPOState> {
  ListReportHistoryPOBloc() : super(const ListReportHistoryPOState()) {
    on<GetListReportHistoryPOEvent>(_handleGetListReportHistory);
    on<LoadmoreListReportHistoryPOEvent>(_handleLoadmoreListReportHistory);
  }

  int currenPage = 0;
  String keyWord = '';

  FutureOr<void> _handleGetListReportHistory(GetListReportHistoryPOEvent event,
      Emitter<ListReportHistoryPOState> emit) async {
    emit(state.copyWith(
      getListReportHistoryPOState: LoadState.loading,
      listReport: [],
    ));
    // if (event.reportCode.isEmptyOrNull()) {
    //   emit(state.copyWith(
    //       getListReportHistoryPOState: LoadState.failure,
    //       message: 'Vui lòng nhập mã PO'));
    //   return;
    // }
    try {
      keyWord = event.reportCode ?? '';
      currenPage = 0;
      final POReportFilterBody body = POReportFilterBody(
        size: 20,
        page: currenPage,
        poIkeyword: keyWord,
        poId: event.poId ?? state.poId,
      );
      final DataState<ListReportHistoryPOEntity> dataState =
          await getIt<ProductUseCase>().factoryPOReports(body);
      if (dataState.isSuccess()) {
        final ListReportHistoryPOModel listReportHistoryPO =
            ListReportHistoryPOModel.fromEntity(entity: dataState.data);
        final List<POReportModel> listCurrentProduction =
            state.listReport ?? [];
        final List<POReportModel> listNewProduction =
            listReportHistoryPO.listProduction ?? [];

        if (listNewProduction.isNotEmpty == true) {
          currenPage += 1;

          listCurrentProduction.addAll(listNewProduction);
        }

        emit(state.copyWith(
          listReport: listCurrentProduction,
          getListReportHistoryPOState: LoadState.success,
          poId: event.poId,
        ));
      } else {
        emit(state.copyWith(
          getListReportHistoryPOState: LoadState.failure,
          message: dataState.error.toString(),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getListReportHistoryPOState: LoadState.failure,
        message: e.toString(),
      ));
    }
  }

  FutureOr<void> _handleLoadmoreListReportHistory(
      LoadmoreListReportHistoryPOEvent event,
      Emitter<ListReportHistoryPOState> emit) async {
    emit(state.copyWith(
      getListReportHistoryPOState: LoadState.loading,
    ));
    if (event.isRefresh == true) {
      currenPage = 0;
      emit(state.copyWith(listReport: []));
    }

    try {
      final POReportFilterBody body = POReportFilterBody(
        size: 20,
        page: currenPage,
        poIkeyword: keyWord,
        poId: state.poId,
      );
      final DataState<ListReportHistoryPOEntity> dataState =
          await getIt<ProductUseCase>().factoryPOReports(body);
      if (dataState.isSuccess()) {
        final ListReportHistoryPOModel listReportHistoryPO =
            ListReportHistoryPOModel.fromEntity(entity: dataState.data);
        final List<POReportModel> listCurrentProduction =
            state.listReport ?? [];
        final List<POReportModel> listNewProduction =
            listReportHistoryPO.listProduction ?? [];

        if (listNewProduction.isNotEmpty == true) {
          currenPage += 1;

          listCurrentProduction.addAll(listNewProduction);
        }

        emit(state.copyWith(
          listReport: listCurrentProduction,
          getListReportHistoryPOState: LoadState.success,
        ));
      } else {
        emit(state.copyWith(
          getListReportHistoryPOState: LoadState.failure,
          message: dataState.error.toString(),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getListReportHistoryPOState: LoadState.failure,
        message: e.toString(),
      ));
    }
  }
}
