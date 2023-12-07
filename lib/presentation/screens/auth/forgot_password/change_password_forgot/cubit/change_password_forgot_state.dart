part of 'change_password_forgot_cubit.dart';

class ChangePasswordForgotState extends Equatable {
  const ChangePasswordForgotState({
    this.changePasswordForgottate,
    this.message,
  });

  @override
  List<Object?> get props => <Object?>[
        changePasswordForgottate,
        message,
      ];

  final LoadState? changePasswordForgottate;
  final String? message;

  ChangePasswordForgotState copyWith({
    LoadState? changePasswordForgottate,
    String? message,
  }) {
    return ChangePasswordForgotState(
      changePasswordForgottate:
          changePasswordForgottate ?? this.changePasswordForgottate,
      message: message ?? this.message,
    );
  }
}
