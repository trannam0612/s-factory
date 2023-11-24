part of 'camera_scan_bloc.dart';

class CameraScanEvent {}

class ToggleTorchEvent extends CameraScanEvent {
  ToggleTorchEvent({
    this.isTurnOn,
  });

  final bool? isTurnOn;
}
