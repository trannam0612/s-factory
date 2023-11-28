import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/common/extensions/iterable_extension.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';
import 'package:s_factory/domain/use_case/product_use_case.dart';
import 'package:s_factory/presentation/model/item_product_model.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/utils.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<AddProductModelEvent>(_handleAddProductModel);
    on<RemoveProductModelEvent>(_handleRemoveProductModel);
    on<ConfirmReportEvent>(_handleConfirmReport);
    on<CheckSerialEvent>(
      _handleCheckSerial,
      transformer: debounce(const Duration(milliseconds: 1000)),
    );
  }

  FutureOr<void> _handleAddProductModel(
      AddProductModelEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      checkSerialState: LoadState.loading,
    ));
    try {
      emit(state.copyWith(
        checkSerialState: LoadState.success,
      ));
      final List<ProductModel> listItem =
          state.listProductModel ?? <ProductModel>[];

      final ProductModel? itemProductModel = event.itemProductModel;
      if (itemProductModel != null) {
        listItem.add(itemProductModel);
        emit(state.copyWith(
          checkSerialState: LoadState.success,
          listProductModel: listItem,
        ));
      } else {
        emit(state.copyWith(
          checkSerialState: LoadState.failure,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        checkSerialState: LoadState.failure,
      ));
    }
  }

  FutureOr<void> _handleRemoveProductModel(
      RemoveProductModelEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      checkSerialState: LoadState.loading,
    ));
    try {
      emit(state.copyWith(
        checkSerialState: LoadState.success,
      ));
      final List<ProductModel> listItem =
          state.listProductModel ?? <ProductModel>[];

      final ProductModel? itemProductModel = event.itemProductModel;
      if (itemProductModel != null) {
        listItem.removeWhere(
            (ProductModel element) => element.id == itemProductModel.id);

        emit(state.copyWith(
          checkSerialState: LoadState.success,
          listProductModel: listItem,
        ));
      } else {
        emit(state.copyWith(
          checkSerialState: LoadState.failure,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        checkSerialState: LoadState.failure,
      ));
    }
  }

  FutureOr<void> _handleCheckSerial(
      CheckSerialEvent event, Emitter<HomeState> emit) async {
    logi(message: '_handleCheckSerial:${event.serial}');
    emit(state.copyWith(checkSerialState: LoadState.loading));

    try {
      final DataState<CheckSerialEntity> dataState =
          await getIt<ProductUseCase>().stampCheckUniqueCode(
        event.serial,
      );

      final List<ProductModel> listProduct =
          state.listProductModel ?? <ProductModel>[];
      if (dataState.isSuccess()) {
        final ProductModel productModel =
            ProductModel.fromEntity(checkSerialEntity: dataState.data);
        // Check PO sản phẩm so với list
        if (listProduct.any(
            (ProductModel element) => element.poCode != productModel.poCode)) {
          emit(state.copyWith(
            checkSerialState: LoadState.failure,
            message: 'Sản phẩm không cùng PO với sản phẩm trước đó.',
          ));
        }
        // Check trùng sản phẩm so với list
        if (!listProduct
            .any((ProductModel element) => element.id == productModel.id)) {
          listProduct.add(productModel);
        } else {
          emit(state.copyWith(
            checkSerialState: LoadState.failure,
            message: 'Sản phẩm đã tồn tại.',
          ));
        }
        emit(state.copyWith(
          checkSerialState: LoadState.success,
          listProductModel: listProduct,
        ));
      } else {
        emit(state.copyWith(
          checkSerialState: LoadState.failure,
          message: dataState.error,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        checkSerialState: LoadState.failure,
        message: e.toString(),
      ));
    }
  }

  FutureOr<void> _handleConfirmReport(
      ConfirmReportEvent event, Emitter<HomeState> emit) async {
    logi(message: '_handleConfirmReport:${state.listProductModel?.length}');
    final List<ProductModel> listItem = state.listProductModel ?? [];

    if (listItem.isNullOrEmpty) {
      return;
    }
    emit(state.copyWith(confirmReportState: LoadState.loading));

    try {
      late String poId;

      if (listItem.isNotNullOrEmpty) {
        poId = listItem.first.poId ?? '';
      }
      final DataState<ProductionOrderEntity> dataState =
          await getIt<ProductUseCase>().factoryProductionOrderDetail(
        poId,
      );

      if (dataState.isSuccess()) {
        final ProductionOrderModel model = ProductionOrderModel.fromEntity(
          entity: dataState.data,
        );
        emit(state.copyWith(
          productionOrderModel: model,
          confirmReportState: LoadState.success,
        ));
      } else {
        emit(state.copyWith(
          confirmReportState: LoadState.failure,
          message: dataState.error.toString(),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        confirmReportState: LoadState.failure,
        message: e.toString(),
      ));
    }
  }
}
