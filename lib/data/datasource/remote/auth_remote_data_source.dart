import 'package:s_factory/data/datasource/remote/body/auth/user_password_arg.dart';
import 'package:s_factory/data/datasource/remote/services/auth_service.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/phone_challege_entity.dart';
import 'package:s_factory/domain/entities/verify_otp_entity.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource(this._authService);

  final AuthService _authService;

  Future<DataState<AuthEntity>> login(
      String phoneNumber, String password) async {
    final DataState<AuthEntity> loginResponse =
        await _authService.login(phoneNumber, password);

    return loginResponse;
  }

  Future<DataState<AuthEntity>> identityLoginWithBusinessRole(
    String roleId,
  ) async {
    final DataState<AuthEntity> loginResponse =
        await _authService.identityLoginWithBusinessRole(roleId);

    return loginResponse;
  }

  Future<DataState<PhoneChallegeEntity>> identityPhoneChallenge(
    String phone,
  ) async {
    final DataState<PhoneChallegeEntity> phoneChallegeResponse =
        await _authService.identityPhoneChallenge(phone);

    return phoneChallegeResponse;
  }

  Future<DataState<VerifyOTPEntity>> identityVerifyForgotPassword(
    int otp,
    String session,
  ) async {
    final DataState<VerifyOTPEntity> verifyOTPResponse =
        await _authService.identityVerifyForgotPassword(otp, session);

    return verifyOTPResponse;
  }

  Future<DataState<VerifyOTPEntity>> identitySetPassword(
    String password,
  ) async {
    final DataState<VerifyOTPEntity> setNewPasswordResponse =
        await _authService.identitySetPassword(password);

    return setNewPasswordResponse;
  }

  Future<DataState<VerifyOTPEntity>> identityChangePassword(
    UserPasswordArgBody body,
  ) async {
    final DataState<VerifyOTPEntity> setNewPasswordResponse =
        await _authService.identityChangePassword(body);

    return setNewPasswordResponse;
  }

  void setNewToken(String token) {
    _authService.setNewToken(token);
  }
}
