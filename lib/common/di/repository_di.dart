import 'package:get_it/get_it.dart';
import 'package:s_factory/data/auth_repository_impl.dart';
import 'package:s_factory/data/product_repository_impl.dart';
import 'package:s_factory/domain/repository/product_repository.dart';

import '../../domain/repository/auth_repository.dart';

class RepositoryDI {
  RepositoryDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(injector(), injector()));
    injector.registerFactory<ProductRepository>(
        () => ProductRepositoryImpl(injector()));
  }
}
