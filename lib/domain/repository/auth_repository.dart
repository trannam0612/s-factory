import 'package:s_factory/data/datasource/remote/body/auth/user_password_arg.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';
import 'package:s_factory/domain/entities/phone_challege_entity.dart';
import 'package:s_factory/domain/entities/verify_otp_entity.dart';

import '../entities/data_state.dart';

abstract class AuthRepository {
  Future<DataState<AuthEntity>> login(String phoneNumber, String password);
  Future<DataState<AuthEntity>> identityLoginWithBusinessRole(String roleId);
  Future<DataState<PhoneChallegeEntity>> identityPhoneChallenge(String phone);
  Future<DataState<VerifyOTPEntity>> identityVerifyForgotPassword(
    int otp,
    String session,
  );
  Future<DataState<VerifyOTPEntity>> identitySetPassword(
    String password,
  );
  Future<DataState<VerifyOTPEntity>> identityChangePassword(
    UserPasswordArgBody body,
  );
}
