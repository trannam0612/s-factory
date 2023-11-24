import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/use_case/auth_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<HandleLoginEvent>(_handleLogin);
  }

  final AuthUseCase authUseCase = getIt();

  FutureOr<void> _handleLogin(
      HandleLoginEvent event, Emitter<LoginState> emit) async {
    logi(message: '_handleLogin');
    emit(state.copyWith(loginState: LoadState.loading));
    try {
      DataState<AuthEntity> dataState = await authUseCase.login(
        event.phone,
        event.password,
      );
      logi(message: 'dataState.data?.token:${dataState.data?.token}');
      final SharedPreferences sharedPreferences = getIt();
      if (dataState.isSuccess()) {
        final String? token = dataState.data?.token;
        if (token != null) {
          sharedPreferences.setString('kToken', token);
        }

        final String? tokenInShared = sharedPreferences.getString('kToken');

        logi(message: 'tokenInShared:${tokenInShared}');
        emit(state.copyWith(
          loginState: LoadState.success,
        ));
      } else {
        emit(state.copyWith(
          loginState: LoadState.failure,
          message: dataState.error.toString(),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        loginState: LoadState.failure,
        message: e.toString(),
      ));
    }
  }
}
