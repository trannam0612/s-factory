part of 'verify_otp_cubit.dart';

class VerifyOTPState extends Equatable {
  const VerifyOTPState({
    this.verifyOTPState,
    this.message,
    this.timer,
  });

  @override
  List<Object?> get props => <Object?>[
        timer,
        verifyOTPState,
        message,
      ];

  final LoadState? verifyOTPState;
  final int? timer;
  final String? message;

  VerifyOTPState copyWith({
    LoadState? verifyOTPState,
    int? timer,
    String? message,
  }) {
    return VerifyOTPState(
      verifyOTPState: verifyOTPState ?? this.verifyOTPState,
      message: message ?? this.message,
      timer: timer ?? this.timer,
    );
  }
}
