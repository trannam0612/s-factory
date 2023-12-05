import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'camera_scan_event.dart';
part 'camera_scan_state.dart';

class CameraScanBloc extends Bloc<CameraScanEvent, CameraScanState> {
  CameraScanBloc()
      : super(const CameraScanState(
          isTurnOnFlash: false,
          isTurnOnScan: true,
        )) {
    on<ToggleTorchEvent>(_handleToggleTorch);
    on<ToggleScanningEvent>(_handleToggleScanning);
  }

  FutureOr<void> _handleToggleTorch(
      ToggleTorchEvent event, Emitter<CameraScanState> emit) {
    emit(state.copyWith());
    try {
      if (event.isTurnOn == true) {
        emit(state.copyWith(
          isTurnOnFlash: true,
        ));
      } else {
        emit(state.copyWith(
          isTurnOnFlash: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isTurnOnFlash: false,
        message: e.toString(),
      ));
    }
  }

  FutureOr<void> _handleToggleScanning(
      ToggleScanningEvent event, Emitter<CameraScanState> emit) {
    try {
      if (event.isTurnOn == true) {
        emit(state.copyWith(
          isTurnOnScan: true,
        ));
      } else {
        emit(state.copyWith(
          isTurnOnScan: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isTurnOnScan: false,
        message: e.toString(),
      ));
    }
  }
}
