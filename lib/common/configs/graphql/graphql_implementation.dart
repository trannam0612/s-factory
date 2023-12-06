import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graphql/client.dart';
import 'package:s_factory/common/configs/graphql/i_graphql_client.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/core_constants.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';

T handleResponse<T>(
    Map<String, dynamic> json, T Function(Object? json) fromJson) {
  return fromJson(json);
}

class GraphQLImplementation<T> implements IGraphQLClient {
  GraphQLImplementation(String url, String token) {
    logi(message: 'url:$url');
    if (token.isNotNullOrEmpty) {
      _headers['Authorization'] = 'Bearer $token';
    }
    final Link _link = HttpLink(
      url,
      defaultHeaders: _headers,
    );
    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }

  final Map<String, String> _headers = <String, String>{};
  late GraphQLClient _client;

  @override
  void setNewToken(String newToken) {
    _headers['Authorization'] = 'Bearer $newToken';
    logi(message: 'Authorization:${_headers['Authorization']}');
  }

  @override
  Future<DataResponse<T>?> query<T extends BaseResponse2>(
    String doc,
    String tag, {
    Map<String, dynamic> vars = const <String, dynamic>{},
  }) async {
    logi(message: 'Authorization:${_headers['Authorization']}');
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        return DataResponse(code: 1001, message: "Không có kết nối mạng");
      } else {
        final WatchQueryOptions<Object?> options = WatchQueryOptions(
          document: gql(doc),
          variables: vars,
          operationName: tag,
          fetchPolicy: FetchPolicy.noCache,
          cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        );
        DataResponse<T>? result;
        // try {
        logi(
            message:
                '-----------------QUERY GRAPHQL API REQUEST------------------');
        logi(message: 'DOCUMENTS:\n$doc');
        logi(message: 'VARIABLES:\n$vars');

        final QueryResult<Object?> response = await _client.query(options);

        logi(
            message:
                '-----------------QUERY GRAPHQL API RESPONSE------------------');
        logi(message: 'DATA:\n${response.toString()}');

        //
        // if (response.hasException || response.exception != null) {
        //   final Iterable<String>? errors = response.exception?.graphqlErrors
        //       .map((GraphQLError e) => e.message);
        //   // result = DataResponse<T>?;
        //   result?.message = errors?.first;
        //   logi(message: 'result?.message${result?.message}');
        //   result?.code = NetworkStatusCode.badRequest;
        //   logi(message: 'result?.code${result?.code}');

        //   return result;
        // }

        //
        result = DataResponse<T>.fromGraphQLReq(response, tag);
        if (response.hasException || response.exception != null) {
          result.code = NetworkStatusCode.newsError;
        } else {
          result.code = NetworkStatusCode.success;
        }
        // } catch (e) {
        //   loge(message: 'ERROR:\n${e.toString()}');
        //   if (e is OperationException) {
        //     final List<String> errors =
        //         e.graphqlErrors.map((GraphQLError e) => e.message).toList();
        //     result?.message = errors.first;
        //     result?.code = NetworkStatusCode.badRequest;
        //   }
        // }
        return result;
      }
    } catch (_) {
      loge(message: "CAN'T CHECK CONNECTIVITY");
      return DataResponse(code: 1001, message: "CAN'T CHECK CONNECTIVITY");
    }
  }

  Map<String, dynamic> parseData(String data) {
    return json.decode(data);
  }

  @override
  Future<DataResponse<T>?> mutation<T extends BaseResponse2>(
    String doc,
    String tag, {
    Map<String, dynamic> vars = const <String, dynamic>{},
  }) async {
    logi(message: 'Authorization:${_headers['Authorization']}');
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        getIt<NavigationService>().showNoInternetDialog();
      }
    } catch (_) {
      loge(message: "CAN'T CHECK CONNECTIVITY");
    }
    final WatchQueryOptions<Object?> options = WatchQueryOptions(
      document: gql(doc),
      variables: vars,
      operationName: tag,
      fetchPolicy: FetchPolicy.noCache,
      cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
    );
    DataResponse<T>? result;
    try {
      logi(
          message:
              '-----------------QUERY GRAPHQL API REQUEST------------------');
      logi(message: 'DOCUMENTS:\n$doc');
      logi(message: 'VARIABLES:\n$vars');

      final QueryResult<Object?> response = await _client.query(options);

      logi(
          message:
              '-----------------QUERY GRAPHQL API RESPONSE------------------');
      logi(message: 'DATA:\n${response.toString()}');

      //
      // if (response.hasException || response.exception != null) {
      //   final Iterable<String>? errors = response.exception?.graphqlErrors
      //       .map((GraphQLError e) => e.message);
      //   // result = DataResponse<T>?;
      //   result?.message = errors?.first;
      //   logi(message: 'result?.message${result?.message}');
      //   result?.code = NetworkStatusCode.badRequest;
      //   logi(message: 'result?.code${result?.code}');

      //   return result;
      // }

      //
      result = DataResponse<T>.fromGraphQLReq(response, tag);
      if (response.hasException || response.exception != null) {
        result.code = NetworkStatusCode.newsError;
      } else {
        result.code = NetworkStatusCode.success;
      }
    } catch (e) {
      loge(message: 'ERROR:\n${e.toString()}');
      if (e is OperationException) {
        final List<String> errors =
            e.graphqlErrors.map((GraphQLError e) => e.message).toList();
        result?.message = errors.first;
        result?.code = NetworkStatusCode.badRequest;
      }
    }
    return result;
    // logi(message: 'Authorization:${_headers['Authorization']}');

    // final MutationOptions<Object?> options = MutationOptions<Object?>(
    //   operationName: tag,
    //   document: gql(doc),
    //   variables: vars,
    //   cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
    // );
    // late QueryResult<Object?> response;
    // try {
    //   logi(
    //       message:
    //           '-----------------MUTATION GRAPHQL API REQUEST------------------');
    //   logi(message: 'DOCUMENTS:\n$doc');
    //   logi(message: 'VARIABLES:\n$vars');

    //   response = await _client.mutate(options);

    //   logi(
    //       message:
    //           '-----------------MUTATION GRAPHQL API RESPONSE------------------');
    //   logi(message: 'DATA:\n${response.toString()}');
    //   return response;
    // } catch (e) {
    //   if (e is OperationException) {
    //     final List<String> errors =
    //         e.graphqlErrors.map((GraphQLError e) => e.message).toList();
    //     print('errors:${errors}');
    //   }
    //   return response;
    // }
  }
}
