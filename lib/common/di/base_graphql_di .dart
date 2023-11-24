import 'package:get_it/get_it.dart';
import 'package:s_factory/common/configs/graphql/graphql_implementation.dart';
import 'package:s_factory/common/configs/graphql/i_graphql_client.dart';

class BaseGraphQLDI {
  BaseGraphQLDI._();

  static Future<void> init(GetIt injector) async {
    final GraphQLImplementation graphQLImplementation = GraphQLImplementation(
        'https://stg-factory-api.smarthiz.vn/graphql', '');
    injector.registerSingleton<IGraphQLClient>(graphQLImplementation);
  }
}
