part of 'camera_scan_bloc.dart';

class CameraScanEvent {}

class ToggleTorchEvent extends CameraScanEvent {
  ToggleTorchEvent({
    this.isTurnOn,
  });

  final bool? isTurnOn;
}

class ToggleScanningEvent extends CameraScanEvent {
  ToggleScanningEvent({
    this.isTurnOn,
  });

  final bool? isTurnOn;
}
