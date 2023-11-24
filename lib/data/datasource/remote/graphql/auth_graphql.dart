import 'package:s_factory/data/datasource/remote/responses/auth_response/login_response2.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

abstract class AuthGraphQL {
  void setNewToken(String token);
  Future<DataResponse<LoginResponse2>?> login(Map<String, dynamic> params);
}
