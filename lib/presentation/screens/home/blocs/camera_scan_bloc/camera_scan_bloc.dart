import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'camera_scan_event.dart';
part 'camera_scan_state.dart';

class CameraScanBloc extends Bloc<CameraScanEvent, CameraScanState> {
  CameraScanBloc()
      : super(const CameraScanState(
          isTurnOnFlash: false,
        )) {
    on<ToggleTorchEvent>(_handleToggleTorch);
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
}
