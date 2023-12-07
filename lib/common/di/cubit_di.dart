import 'package:get_it/get_it.dart';
import 'package:s_factory/presentation/screens/auth/change_password/cubit/change_password_cubit.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/change_password_forgot/cubit/change_password_forgot_cubit.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/confirm_otp/cubit/verify_otp_cubit.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/input_phone/cubit/phone_challege_cubit.dart';

class CubitDI {
  CubitDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory<PhoneChallegeCubit>(() => PhoneChallegeCubit());
    injector.registerFactory<VerifyOTPCubit>(() => VerifyOTPCubit());
    injector.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit());
    injector.registerFactory<ChangePasswordForgotCubit>(
        () => ChangePasswordForgotCubit());
  }
}
