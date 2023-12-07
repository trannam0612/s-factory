import 'package:s_factory/data/datasource/remote/responses/auth_response/verify_otp_response.dart';
import 'package:s_factory/domain/entities/verify_otp_entity.dart';

import '../base_mapper.dart';

extension VerifyOTPResponseMapperX on VerifyOTPResponse? {
  VerifyOTPEntity mapToEntity() {
    return VerifyOTPEntity(
      accessToken: this?.accessToken ?? '',
      refreshToken: this?.refreshToken ?? '',
    );
  }
}

class VerifyOTPResponseMapper
    extends BaseMapper<VerifyOTPEntity, VerifyOTPResponse> {
  @override
  VerifyOTPEntity call(VerifyOTPResponse? response) {
    return response.mapToEntity();
  }
}
