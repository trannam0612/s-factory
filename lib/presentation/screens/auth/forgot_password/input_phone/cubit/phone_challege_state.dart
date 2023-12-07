part of 'phone_challege_cubit.dart';

class PhoneChallegeState extends Equatable {
  const PhoneChallegeState({
    this.phoneChallegeState,
    this.message,
    this.session,
    this.timer,
  });

  @override
  List<Object?> get props => <Object?>[
        timer,
        phoneChallegeState,
        message,
        session,
      ];

  final LoadState? phoneChallegeState;
  final int? timer;
  final String? message;
  final String? session;

  PhoneChallegeState copyWith({
    LoadState? phoneChallegeState,
    int? timer,
    String? message,
    String? session,
  }) {
    return PhoneChallegeState(
      phoneChallegeState: phoneChallegeState ?? this.phoneChallegeState,
      message: message ?? this.message,
      session: session ?? this.session,
      timer: timer ?? this.timer,
    );
  }
}
