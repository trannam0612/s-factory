part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class HandleLoginEvent extends LoginEvent {
  const HandleLoginEvent({required this.phone, required this.password});

  final String phone;
  final String password;
}
