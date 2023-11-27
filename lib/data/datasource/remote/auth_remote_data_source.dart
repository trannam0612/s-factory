import 'package:s_factory/data/datasource/remote/services/auth_service.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';
import 'package:s_factory/domain/entities/data_state.dart';

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

  void setNewToken(String token) {
    _authService.setNewToken(token);
  }
}
