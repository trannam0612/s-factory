import 'package:s_factory/data/datasource/remote/body/auth/user_password_arg.dart';
import 'package:s_factory/data/datasource/remote/graphql/auth_graphql.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/login_response2.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/phone_challenge_response.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/verify_otp_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';
import 'package:s_factory/data/datasource/remote/services/base_service.dart';
import 'package:s_factory/data/mapper/auth/phone_challege_response_mapper.dart';
import 'package:s_factory/data/mapper/auth/verify_otp_response_mapper.dart';
import 'package:s_factory/data/mapper/auth_response_mapper.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';
import 'package:s_factory/domain/entities/phone_challege_entity.dart';
import 'package:s_factory/domain/entities/verify_otp_entity.dart';

import '../../../../domain/entities/data_state.dart';

class AuthService with ConvertAbleDataState {
  AuthService(this._api);

  final AuthGraphQL _api;

  Future<DataState<AuthEntity>> login(
      String phoneNumber, String password) async {
    try {
      final DataResponse<LoginResponse2>? response = await _api
          .login(<String, String>{'phone': phoneNumber, 'password': password});

      return convertToDataState<AuthEntity, LoginResponse2>(
          response, AuthResponseMapper());
    } catch (error) {
      return DataFailed<AuthEntity>(
        error.toString(),
      );
    }
  }

  Future<DataState<AuthEntity>> identityLoginWithBusinessRole(
    String roleId,
  ) async {
    try {
      final DataResponse<LoginResponse2>? response =
          await _api.identityLoginWithBusinessRole(<String, String>{
        'businessRoleId': roleId,
      });

      return convertToDataState<AuthEntity, LoginResponse2>(
          response, AuthResponseMapper());
    } catch (error) {
      return DataFailed<AuthEntity>(
        error.toString(),
      );
    }
  }

  Future<DataState<PhoneChallegeEntity>> identityPhoneChallenge(
    String phone,
  ) async {
    try {
      final DataResponse<PhoneChallegeResponse>? response =
          await _api.identityPhoneChallenge(<String, String>{
        'phone': phone,
      });

      return convertToDataState<PhoneChallegeEntity, PhoneChallegeResponse>(
          response, PhoneChallegeResponseMapper());
    } catch (error) {
      return DataFailed<PhoneChallegeEntity>(
        error.toString(),
      );
    }
  }

  Future<DataState<VerifyOTPEntity>> identityVerifyForgotPassword(
    int otp,
    String session,
  ) async {
    try {
      final DataResponse<VerifyOTPResponse>? response =
          await _api.identityVerifyForgotPassword(<String, dynamic>{
        'otp': otp,
        'session': session,
      });

      return convertToDataState<VerifyOTPEntity, VerifyOTPResponse>(
          response, VerifyOTPResponseMapper());
    } catch (error) {
      return DataFailed<VerifyOTPEntity>(
        error.toString(),
      );
    }
  }

  Future<DataState<VerifyOTPEntity>> identitySetPassword(
    String password,
  ) async {
    try {
      final DataResponse<VerifyOTPResponse>? response =
          await _api.identitySetPassword(<String, String>{
        'password': password,
      });

      return convertToDataState<VerifyOTPEntity, VerifyOTPResponse>(
          response, VerifyOTPResponseMapper());
    } catch (error) {
      return DataFailed<VerifyOTPEntity>(
        error.toString(),
      );
    }
  }

  Future<DataState<VerifyOTPEntity>> identityChangePassword(
    UserPasswordArgBody body,
  ) async {
    try {
      final DataResponse<VerifyOTPResponse>? response =
          await _api.identityChangePassword(body);

      return convertToDataState<VerifyOTPEntity, VerifyOTPResponse>(
          response, VerifyOTPResponseMapper());
    } catch (error) {
      return DataFailed<VerifyOTPEntity>(
        error.toString(),
      );
    }
  }

  void setNewToken(String token) {
    _api.setNewToken(token);
  }
}
