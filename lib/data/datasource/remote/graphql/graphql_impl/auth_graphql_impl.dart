import 'package:s_factory/common/configs/graphql/i_graphql_client.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/data/datasource/remote/body/auth/user_password_arg.dart';
import 'package:s_factory/data/datasource/remote/graphql/auth_graphql.dart';
import 'package:s_factory/data/datasource/remote/requests/auth_request.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/login_response2.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/phone_challenge_response.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/verify_otp_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

class AuthGraphQLImplement extends AuthGraphQL {
  AuthGraphQLImplement(this._client);

  final IGraphQLClient _client;
  @override
  Future<DataResponse<LoginResponse2>?> login(
      Map<String, dynamic> params) async {
    final DataResponse<LoginResponse2>? response = await _client.query(
      AuthRequest.identityLogin,
      'identityLogin',
      vars: params,
    );
    return response;
  }

  @override
  Future<DataResponse<LoginResponse2>?> identityLoginWithBusinessRole(
      Map<String, dynamic> params) async {
    final DataResponse<LoginResponse2>? response = await _client.query(
      AuthRequest.identityLoginWithBusinessRole,
      'identityLoginWithBusinessRole',
      vars: params,
    );
    return response;
  }

  @override
  Future<DataResponse<PhoneChallegeResponse>?> identityPhoneChallenge(
      Map<String, dynamic> params) async {
    final DataResponse<PhoneChallegeResponse>? response =
        await _client.mutation(
      AuthRequest.identityPhoneChallenge,
      'identityPhoneChallenge',
      vars: params,
    );
    return response;
  }

  @override
  Future<DataResponse<VerifyOTPResponse>?> identityVerifyForgotPassword(
    Map<String, dynamic> params,
  ) async {
    final DataResponse<VerifyOTPResponse>? response = await _client.mutation(
      AuthRequest.identityVerifyForgotPassword,
      'identityVerifyForgotPassword',
      vars: params,
    );
    return response;
  }

  @override
  Future<DataResponse<VerifyOTPResponse>?> identitySetPassword(
    Map<String, dynamic> params,
  ) async {
    final DataResponse<VerifyOTPResponse>? response = await _client.mutation(
      AuthRequest.identitySetPassword,
      'identitySetPassword',
      vars: params,
    );
    return response;
  }

  @override
  Future<DataResponse<VerifyOTPResponse>?> identityChangePassword(
    UserPasswordArgBody body,
  ) async {
    final Map<String, dynamic> jsonBody = body.toJson();
    final Map<String, dynamic> json = {'arguments': jsonBody};
    logi(message: 'jsonBody${jsonBody}');
    final DataResponse<VerifyOTPResponse>? response = await _client.mutation(
      AuthRequest.identityChangePassword,
      'identityChangePassword',
      vars: json,
    );
    return response;
  }

  @override
  void setNewToken(String token) {
    _client.setNewToken(token);
  }
}
