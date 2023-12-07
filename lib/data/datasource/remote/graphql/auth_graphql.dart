import 'package:s_factory/data/datasource/remote/body/auth/user_password_arg.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/login_response2.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/phone_challenge_response.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/verify_otp_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

abstract class AuthGraphQL {
  void setNewToken(String token);
  Future<DataResponse<LoginResponse2>?> login(Map<String, dynamic> params);
  Future<DataResponse<LoginResponse2>?> identityLoginWithBusinessRole(
      Map<String, dynamic> params);
  Future<DataResponse<PhoneChallegeResponse>?> identityPhoneChallenge(
      Map<String, dynamic> params);
  Future<DataResponse<VerifyOTPResponse>?> identityVerifyForgotPassword(
    Map<String, dynamic> params,
  );
  Future<DataResponse<VerifyOTPResponse>?> identitySetPassword(
      Map<String, dynamic> params);

  Future<DataResponse<VerifyOTPResponse>?> identityChangePassword(
    UserPasswordArgBody body,
  );
}
