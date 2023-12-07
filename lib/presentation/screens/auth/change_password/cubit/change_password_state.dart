part of 'change_password_cubit.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
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

  ChangePasswordState copyWith({
    LoadState? changePasswordForgottate,
    String? message,
  }) {
    return ChangePasswordState(
      changePasswordForgottate:
          changePasswordForgottate ?? this.changePasswordForgottate,
      message: message ?? this.message,
    );
  }
}
