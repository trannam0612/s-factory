import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/phone_challege_entity.dart';
import 'package:s_factory/domain/use_case/auth_use_case.dart';

part 'phone_challege_state.dart';

class PhoneChallegeCubit extends Cubit<PhoneChallegeState> {
  PhoneChallegeCubit() : super(const PhoneChallegeState());

  void handlePhoneChallege(String phone) async {
    emit(
      state.copyWith(
        phoneChallegeState: LoadState.loading,
      ),
    );
    try {
      final DataState<PhoneChallegeEntity> dataState =
          await getIt<AuthUseCase>().identityPhoneChallenge(phone);
      if (dataState.isSuccess()) {
        emit(
          state.copyWith(
            phoneChallegeState: LoadState.success,
            session: dataState.data?.session,
          ),
        );
      } else {
        emit(
          state.copyWith(
            phoneChallegeState: LoadState.failure,
            message: dataState.error,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          phoneChallegeState: LoadState.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
