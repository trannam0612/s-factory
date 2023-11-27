import 'package:s_factory/data/datasource/remote/graphql/auth_graphql.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/login_response2.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';
import 'package:s_factory/data/datasource/remote/services/base_service.dart';
import 'package:s_factory/data/mapper/auth_response_mapper.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';

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

  void setNewToken(String token) {
    _api.setNewToken(token);
  }
}
