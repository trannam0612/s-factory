import 'package:s_factory/data/datasource/remote/responses/auth_response/phone_challenge_response.dart';
import 'package:s_factory/domain/entities/phone_challege_entity.dart';

import '../base_mapper.dart';

extension PhoneChallegeResponseMapperX on PhoneChallegeResponse? {
  PhoneChallegeEntity mapToEntity() {
    return PhoneChallegeEntity(
      organization: this?.organization ?? '',
      session: this?.session ?? '',
      target: this?.target ?? '',
    );
  }
}

class PhoneChallegeResponseMapper
    extends BaseMapper<PhoneChallegeEntity, PhoneChallegeResponse> {
  @override
  PhoneChallegeEntity call(PhoneChallegeResponse? response) {
    return response.mapToEntity();
  }
}
