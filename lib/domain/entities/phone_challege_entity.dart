import 'package:s_factory/domain/entities/base_entity_model.dart';

class PhoneChallegeEntity extends BaseEntityModel {
  PhoneChallegeEntity({
    this.organization,
    this.session,
    this.target,
  });

  final String? organization;
  final String? session;
  final String? target;
  //  organization
  // session
  // target
}
