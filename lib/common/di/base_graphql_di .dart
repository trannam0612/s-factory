import 'package:get_it/get_it.dart';
import 'package:s_factory/common/configs/graphql/graphql_implementation.dart';
import 'package:s_factory/common/configs/graphql/i_graphql_client.dart';
import 'package:s_factory/common/configs/network_config.dart';
import 'package:s_factory/common/di/app_injector.dart';

class BaseGraphQLDI {
  BaseGraphQLDI._();

  static Future<void> init(GetIt injector) async {
    final NetWorkMode netWorkMode = getIt();
    final GraphQLImplementation graphQLImplementation =
        GraphQLImplementation(netWorkMode.baseUrl, '');
    injector.registerSingleton<IGraphQLClient>(graphQLImplementation);
  }
}
