import 'dart:async';

import 'package:graphql/client.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

abstract class IGraphQLClient {
  void setNewToken(String token);

  Future<DataResponse<T>?> query<T extends BaseResponse2>(
    String doc,
    String tag, {
    Map<String, dynamic> vars = const <String, dynamic>{},
  });

  Future<QueryResult> mutation(
    String doc,
    String tag, {
    Map<String, dynamic> vars = const <String, dynamic>{},
  });
}
