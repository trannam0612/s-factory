import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/data/datasource/remote/body/filter_list_all_production_order_body.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/list_all_production_order_entity.dart';
import 'package:s_factory/domain/use_case/product_use_case.dart';
import 'package:s_factory/presentation/model/list_all_report_history_model.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';

part 'list_report_history_event.dart';
part 'list_report_history_state.dart';

class ListReportHistoryBloc
    extends Bloc<ListReportHistoryEvent, ListReportHistoryState> {
  ListReportHistoryBloc() : super(const ListReportHistoryState()) {
    on<GetListReportHistoryEvent>(_handleGetListReportHistory);
    on<LoadmoreListReportHistoryEvent>(_handleLoadmoreListReportHistory);
  }

  int currenPage = 0;
  String keyWord = '';

  FutureOr<void> _handleGetListReportHistory(GetListReportHistoryEvent event,
      Emitter<ListReportHistoryState> emit) async {
    emit(state.copyWith(
      getListReportHistoryState: LoadState.loading,
      listReport: [],
    ));
    // if (event.pOCode.isEmptyOrNull()) {
    //   emit(state.copyWith(
    //       getListReportHistoryState: LoadState.failure,
    //       message: 'Vui lòng nhập mã PO'));
    //   return;
    // }
    try {
      keyWord = event.pOCode ?? '';
      currenPage = 0;
      final FilterListAllProductionOrderBody body =
          FilterListAllProductionOrderBody(
        size: 20,
        page: currenPage,
        poIkeyword: keyWord,
      );
      final DataState<ListAllProductionOrderEntity> dataState =
          await getIt<ProductUseCase>().factoryAllProductionOrders(body);
      if (dataState.isSuccess()) {
        final ListAllProductionOrderModel listAllProductionOrderModel =
            ListAllProductionOrderModel.fromEntity(entity: dataState.data);
        final List<ProductionOrderModel> listCurrentProduction =
            state.listReport ?? [];
        final List<ProductionOrderModel> listNewProduction =
            listAllProductionOrderModel.listProduction ?? [];

        if (listNewProduction.isNotEmpty == true) {
          currenPage += 1;

          listCurrentProduction.addAll(listNewProduction);
        }

        emit(state.copyWith(
          listReport: listCurrentProduction,
          getListReportHistoryState: LoadState.success,
        ));
      } else {
        emit(state.copyWith(
          getListReportHistoryState: LoadState.failure,
          message: dataState.error.toString(),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getListReportHistoryState: LoadState.failure,
        message: e.toString(),
      ));
    }
  }

  FutureOr<void> _handleLoadmoreListReportHistory(
      LoadmoreListReportHistoryEvent event,
      Emitter<ListReportHistoryState> emit) async {
    emit(state.copyWith(
      getListReportHistoryState: LoadState.loading,
    ));
    if (event.isRefresh == true) {
      currenPage = 0;
      emit(state.copyWith(listReport: []));
    }

    try {
      final FilterListAllProductionOrderBody body =
          FilterListAllProductionOrderBody(
        size: 20,
        page: currenPage,
        poIkeyword: keyWord,
      );
      final DataState<ListAllProductionOrderEntity> dataState =
          await getIt<ProductUseCase>().factoryAllProductionOrders(body);
      if (dataState.isSuccess()) {
        final ListAllProductionOrderModel listAllProductionOrderModel =
            ListAllProductionOrderModel.fromEntity(entity: dataState.data);
        final List<ProductionOrderModel> listCurrentProduction =
            state.listReport ?? [];
        final List<ProductionOrderModel> listNewProduction =
            listAllProductionOrderModel.listProduction ?? [];

        if (listNewProduction.isNotEmpty == true) {
          currenPage += 1;

          listCurrentProduction.addAll(listNewProduction);
        }

        emit(state.copyWith(
          listReport: listCurrentProduction,
          getListReportHistoryState: LoadState.success,
        ));
      } else {
        emit(state.copyWith(
          getListReportHistoryState: LoadState.failure,
          message: dataState.error.toString(),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getListReportHistoryState: LoadState.failure,
        message: e.toString(),
      ));
    }
  }
}
