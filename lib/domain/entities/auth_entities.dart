import 'package:s_factory/domain/entities/base_entity_model.dart';

class AuthEntity extends BaseEntityModel {
  AuthEntity({
    required this.token,
    this.refreshToken,
  });

  String token = '';
  final String? refreshToken;
}
