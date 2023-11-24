import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:s_factory/common/constant/core_constants.dart';

abstract class BaseResponse2<T> {
  BaseResponse2({
    this.data,
  });

  final T? data;

  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json);
}

class DataResponse<TResponse extends BaseResponse2> extends BaseResponse2 {
  DataResponse.fromGraphQLReq(QueryResult queryResult, String tag) {
    code = NetworkStatusCode.success;

    final Map<String, dynamic>? data = queryResult.data;
    if (data != null) {
      final Map<String, dynamic> jsonData = data[tag];
      final TResponse tResponse = GetIt.I.get<TResponse>();
      this.data = tResponse.fromJson(jsonData);
    }

    final OperationException? exception = queryResult.exception;
    if (exception != null) {
      final List<String> errors =
          exception.graphqlErrors.map((GraphQLError e) => e.message).toList();
      message = errors.first;
    }
  }

  DataResponse({
    this.code,
    this.data,
    this.message,
  });
  TResponse? data;
  String? message;
  int? code;

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
