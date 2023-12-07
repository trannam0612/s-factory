import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/verify_otp_entity.dart';
import 'package:s_factory/domain/use_case/auth_use_case.dart';

part 'change_password_forgot_state.dart';

class ChangePasswordForgotCubit extends Cubit<ChangePasswordForgotState> {
  ChangePasswordForgotCubit() : super(const ChangePasswordForgotState());

  Future<void> handleChangePasswordForgot(
    String password,
  ) async {
    logi(message: 'OTP:$password');
    emit(
      state.copyWith(
        changePasswordForgottate: LoadState.loading,
      ),
    );

    try {
      final DataState<VerifyOTPEntity> dataState =
          await getIt<AuthUseCase>().identitySetPassword(password);
      if (dataState.isSuccess()) {
        emit(
          state.copyWith(
              changePasswordForgottate: LoadState.success,
              message: 'Đổi mật khẩu thành công'),
        );
      } else {
        emit(
          state.copyWith(
            changePasswordForgottate: LoadState.failure,
            message: dataState.error,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          changePasswordForgottate: LoadState.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
