import 'package:s_factory/data/datasource/remote/responses/auth_response/login_response2.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';

import 'base_mapper.dart';

extension AuthResponseMapperX on LoginResponse2? {
  AuthEntity mapToEntity() {
    return AuthEntity(
      token: this?.accessToken ?? '',
      refreshToken: this?.refreshToken ?? '',
    );
  }
}

class AuthResponseMapper extends BaseMapper<AuthEntity, LoginResponse2> {
  @override
  AuthEntity call(LoginResponse2? response) {
    return response.mapToEntity();
  }
}
