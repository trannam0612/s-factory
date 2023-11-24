import 'package:s_factory/data/datasource/remote/responses/product/check_serial_response.dart';
import 'package:s_factory/data/mapper/base_mapper.dart';
import 'package:s_factory/domain/entities/product/check_serial_entity.dart';

class CheckSerialResponseMapper
    extends BaseMapper<CheckSerialEntity, CheckSerialResponse> {
  @override
  CheckSerialEntity call(CheckSerialResponse? response) {
    return CheckSerialEntity.fromResponse(
      checkSerialResponse: response,
    );
  }
}
