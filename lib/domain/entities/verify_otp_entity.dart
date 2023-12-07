import 'package:s_factory/domain/entities/base_entity_model.dart';

class VerifyOTPEntity extends BaseEntityModel {
  VerifyOTPEntity({
    this.accessToken,
    this.refreshToken,
  });

  final String? accessToken;
  final String? refreshToken;
  //  organization
  // session
  // target
}
