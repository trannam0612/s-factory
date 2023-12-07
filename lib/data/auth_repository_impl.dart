import 'package:s_factory/data/datasource/local/auth_local_datasource.dart';
import 'package:s_factory/data/datasource/remote/auth_remote_data_source.dart';
import 'package:s_factory/data/datasource/remote/body/auth/user_password_arg.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/entities/phone_challege_entity.dart';
import 'package:s_factory/domain/entities/verify_otp_entity.dart';
import 'package:s_factory/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  @override
  Future<DataState<AuthEntity>> login(
      String phoneNumber, String password) async {
    DataState<AuthEntity> response =
        await _authRemoteDataSource.login(phoneNumber, password);
    if (response.isSuccess()) {
      final String? token = response.data?.token;
      if (token != null) {
        _authRemoteDataSource.setNewToken(token);
      }
    }
    return response;
  }

  @override
  Future<DataState<AuthEntity>> identityLoginWithBusinessRole(
      String roleId) async {
    DataState<AuthEntity> response =
        await _authRemoteDataSource.identityLoginWithBusinessRole(
      roleId,
    );
    if (response.isSuccess()) {
      final String? token = response.data?.token;
      if (token != null) {
        _authRemoteDataSource.setNewToken(token);
      }
    }
    return response;
  }

  @override
  Future<DataState<PhoneChallegeEntity>> identityPhoneChallenge(
      String phone) async {
    DataState<PhoneChallegeEntity> response =
        await _authRemoteDataSource.identityPhoneChallenge(
      phone,
    );

    return response;
  }

  @override
  Future<DataState<VerifyOTPEntity>> identityVerifyForgotPassword(
    int otp,
    String session,
  ) async {
    DataState<VerifyOTPEntity> response =
        await _authRemoteDataSource.identityVerifyForgotPassword(
      otp,
      session,
    );

    if (response.isSuccess()) {
      final String? token = response.data?.accessToken;
      if (token != null) {
        _authRemoteDataSource.setNewToken(token);
      }
    }

    return response;
  }

  @override
  Future<DataState<VerifyOTPEntity>> identitySetPassword(
      String password) async {
    DataState<VerifyOTPEntity> response =
        await _authRemoteDataSource.identitySetPassword(
      password,
    );

    return response;
  }

  @override
  Future<DataState<VerifyOTPEntity>> identityChangePassword(
      UserPasswordArgBody body) async {
    DataState<VerifyOTPEntity> response =
        await _authRemoteDataSource.identityChangePassword(
      body,
    );

    return response;
  }
}
