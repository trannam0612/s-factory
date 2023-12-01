import 'package:s_factory/domain/entities/auth/user_entity.dart';

class UserModel {
  factory UserModel.fromEntity({
    UserEntity? entity,
  }) {
    return UserModel(
      fullName: entity?.fullName,
    );
  }
  UserModel({
    this.fullName,
  });

  final String? fullName;
}
