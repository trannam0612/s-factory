part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.loginState,
    this.message,
  });

  @override
  List<Object?> get props => <Object?>[
        loginState,
        message,
      ];

  final LoadState? loginState;
  final String? message;

  LoginState copyWith({
    LoadState? loginState,
    String? message,
  }) {
    return LoginState(
      loginState: loginState ?? this.loginState,
      message: message ?? this.message,
    );
  }
}
