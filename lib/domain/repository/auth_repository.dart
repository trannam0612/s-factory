import 'package:s_factory/domain/entities/auth_entities.dart';

import '../entities/data_state.dart';

abstract class AuthRepository {
  Future<DataState<AuthEntity>> login(String phoneNumber, String password);
  Future<DataState<AuthEntity>> identityLoginWithBusinessRole(String roleId);
}
