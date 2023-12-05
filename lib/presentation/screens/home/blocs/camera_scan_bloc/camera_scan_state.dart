part of 'camera_scan_bloc.dart';

class CameraScanState extends Equatable {
  const CameraScanState({
    this.isTurnOnFlash,
    this.isTurnOnScan,
    this.message,
  });

  final bool? isTurnOnFlash;
  final bool? isTurnOnScan;
  final String? message;
  CameraScanState copyWith({
    bool? isTurnOnFlash,
    bool? isTurnOnScan,
    String? message,
  }) {
    return CameraScanState(
      isTurnOnFlash: isTurnOnFlash ?? this.isTurnOnFlash,
      isTurnOnScan: isTurnOnScan ?? this.isTurnOnScan,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isTurnOnFlash,
        isTurnOnScan,
        message,
      ];
}
