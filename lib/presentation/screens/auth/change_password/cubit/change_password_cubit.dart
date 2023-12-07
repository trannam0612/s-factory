import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/data/datasource/remote/body/auth/user_password_arg.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/verify_otp_entity.dart';
import 'package:s_factory/domain/use_case/auth_use_case.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState());

  Future<void> handleChangePassword(
    String curremtPassword,
    String newPassword,
  ) async {
    logi(message: 'OTP:$newPassword');
    emit(
      state.copyWith(
        changePasswordForgottate: LoadState.loading,
      ),
    );
    if (curremtPassword.isEmptyOrNull()) {
      emit(
        state.copyWith(
            changePasswordForgottate: LoadState.failure,
            message: 'Mật khẩu cũ không được để trống'),
      );
    }

    try {
      final UserPasswordArgBody body = UserPasswordArgBody(
          oldPassword: curremtPassword, newPassword: newPassword);
      final DataState<VerifyOTPEntity> dataState =
          await getIt<AuthUseCase>().identityChangePassword(body);
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
