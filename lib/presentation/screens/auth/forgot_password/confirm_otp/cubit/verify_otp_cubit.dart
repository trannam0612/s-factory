import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/verify_otp_entity.dart';
import 'package:s_factory/domain/use_case/auth_use_case.dart';

part 'verify_otp_state.dart';

class VerifyOTPCubit extends Cubit<VerifyOTPState> {
  VerifyOTPCubit() : super(const VerifyOTPState()) {
    initTimeOtp();
  }

  Future<void> handleVerifyOTP(String otp, String session) async {
    logi(message: 'OTP:$otp=====Session:$session');
    emit(
      state.copyWith(
        verifyOTPState: LoadState.loading,
      ),
    );
    if (otp.isNullOrEmpty || otp.length < 6) {
      emit(
        state.copyWith(
          verifyOTPState: LoadState.failure,
          message: 'OTP sai định dạng',
        ),
      );
      return;
    }
    if (session.isNullOrEmpty) {
      emit(
        state.copyWith(
            verifyOTPState: LoadState.failure,
            message: 'Session sai định dạng'),
      );
      return;
    }
    try {
      final DataState<VerifyOTPEntity> dataState =
          await getIt<AuthUseCase>().identityVerifyForgotPassword(
        int.parse(otp),
        session,
      );
      if (dataState.isSuccess()) {
        emit(
          state.copyWith(
            verifyOTPState: LoadState.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            verifyOTPState: LoadState.failure,
            message: dataState.error,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          verifyOTPState: LoadState.failure,
          message: e.toString(),
        ),
      );
    }
  }

  late Timer timer;

  void closeTimer() {
    timer.cancel();
  }

  Future<void> initTimeOtp() async {
    int start = 120;
    const Duration oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
          emit(
            state.copyWith(timer: start),
          );
        }
      },
    );

    // try {
    //   emit(
    //     state.copyWith(timer: start),
    //   );
    // } catch (e) {
    //   emit(
    //     state.copyWith(
    //       message: e.toString(),
    //     ),
    //   );
    // }
  }
}
