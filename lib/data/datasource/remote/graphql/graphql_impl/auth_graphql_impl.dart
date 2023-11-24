import 'package:s_factory/common/configs/graphql/i_graphql_client.dart';
import 'package:s_factory/data/datasource/remote/graphql/auth_graphql.dart';
import 'package:s_factory/data/datasource/remote/requests/auth_request.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/login_response2.dart';
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
  void setNewToken(String token) {
    _client.setNewToken(token);
  }
}
