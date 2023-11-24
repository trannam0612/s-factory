import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';
import 'package:s_factory/data/mapper/base_mapper.dart';
import 'package:s_factory/domain/entities/data_state.dart';

mixin ConvertAbleDataState {
  DataState<A> convertToDataState<A, B extends BaseResponse2>(
      DataResponse<B>? response, BaseMapper<A, B> mapper) {
    if (response?.code == 200) {
      return DataSuccess<A>(
        mapper.call(
          response?.data,
        ),
      );
    }
    return DataFailed<A>(
      response?.message,
    );
  }
}
