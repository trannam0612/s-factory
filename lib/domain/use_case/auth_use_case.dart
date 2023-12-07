import 'package:s_factory/data/datasource/remote/body/auth/user_password_arg.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';
import 'package:s_factory/domain/entities/phone_challege_entity.dart';
import 'package:s_factory/domain/entities/verify_otp_entity.dart';
import 'package:s_factory/domain/repository/auth_repository.dart';

import '../entities/data_state.dart';

class AuthUseCase {
  AuthUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<DataState<AuthEntity>> login(
      String phoneNumber, String password) async {
    DataState<AuthEntity> entity = await _authRepository.login(
      phoneNumber,
      password,
    );
    return entity;
  }

  Future<DataState<AuthEntity>> identityLoginWithBusinessRole(
      String roleId) async {
    DataState<AuthEntity> entity =
        await _authRepository.identityLoginWithBusinessRole(
      roleId,
    );
    return entity;
  }

  Future<DataState<PhoneChallegeEntity>> identityPhoneChallenge(
      String phone) async {
    DataState<PhoneChallegeEntity> entity =
        await _authRepository.identityPhoneChallenge(
      phone,
    );
    return entity;
  }

  Future<DataState<VerifyOTPEntity>> identityVerifyForgotPassword(
      int otp, String session) async {
    DataState<VerifyOTPEntity> entity =
        await _authRepository.identityVerifyForgotPassword(
      otp,
      session,
    );
    return entity;
  }

  Future<DataState<VerifyOTPEntity>> identitySetPassword(
      String password) async {
    DataState<VerifyOTPEntity> entity =
        await _authRepository.identitySetPassword(
      password,
    );
    return entity;
  }

  Future<DataState<VerifyOTPEntity>> identityChangePassword(
      UserPasswordArgBody body) async {
    DataState<VerifyOTPEntity> entity =
        await _authRepository.identityChangePassword(
      body,
    );
    return entity;
  }

  // Future<UserInfoEntity> getUserInfo() async {
  //   UserInfoEntity entity = await _authRepository.getUserInfo();
  //   return entity;
  // }
}
