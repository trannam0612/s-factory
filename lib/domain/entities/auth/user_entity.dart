import 'package:s_factory/data/datasource/remote/responses/auth_response/user_response.dart';

class UserEntity {
  UserEntity({
    this.fullName,
  });

  final String? fullName;
  factory UserEntity.fromResponse({
    UserResponse? response,
  }) {
    return UserEntity(
      fullName: response?.fullName,
    );
  }
}
