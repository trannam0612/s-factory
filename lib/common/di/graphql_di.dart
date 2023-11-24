import 'package:get_it/get_it.dart';
import 'package:s_factory/data/datasource/remote/graphql/auth_graphql.dart';
import 'package:s_factory/data/datasource/remote/graphql/graphql_impl/auth_graphql_impl.dart';
import 'package:s_factory/data/datasource/remote/graphql/graphql_impl/product_graphql_impl.dart';
import 'package:s_factory/data/datasource/remote/graphql/product_graphql.dart';

class GraphQLDI {
  GraphQLDI._();

  static Future<void> init(GetIt injector) async {
    injector
        .registerFactory<AuthGraphQL>(() => AuthGraphQLImplement(injector()));
    injector.registerFactory<ProductGraphQL>(
        () => ProductGraphQLImplement(injector()));
  }
}
