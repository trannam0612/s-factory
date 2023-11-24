import 'package:get_it/get_it.dart';
import 'package:s_factory/data/datasource/remote/graphql/auth_graphql.dart';
import 'package:s_factory/data/datasource/remote/services/auth_service.dart';
import 'package:s_factory/data/datasource/remote/services/product_service.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';

class ServiceDI {
  ServiceDI._();

  static Future<void> init(GetIt injector) async {
    injector
        .registerLazySingleton<NavigationService>(() => NavigationService());
    injector.registerFactory<AuthService>(
        () => AuthService(injector<AuthGraphQL>()));
    injector.registerFactory<ProductService>(() => ProductService(injector()));
  }
}
