import 'package:s_factory/domain/entities/auth_entities.dart';
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

  // Future<UserInfoEntity> getUserInfo() async {
  //   UserInfoEntity entity = await _authRepository.getUserInfo();
  //   return entity;
  // }
}
