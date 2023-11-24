part of 'camera_scan_bloc.dart';

class CameraScanState extends Equatable {
  const CameraScanState({
    this.isTurnOnFlash,
    this.message,
  });

  final bool? isTurnOnFlash;
  final String? message;
  CameraScanState copyWith({
    bool? isTurnOnFlash,
    String? message,
  }) {
    return CameraScanState(
      isTurnOnFlash: isTurnOnFlash ?? this.isTurnOnFlash,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isTurnOnFlash,
        message,
      ];
}
