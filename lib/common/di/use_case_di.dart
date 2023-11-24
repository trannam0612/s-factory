import 'package:get_it/get_it.dart';
import 'package:s_factory/domain/use_case/auth_use_case.dart';
import 'package:s_factory/domain/use_case/product_use_case.dart';

class UseCaseDI {
  UseCaseDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory<AuthUseCase>(() => AuthUseCase(injector()));
    injector.registerFactory<ProductUseCase>(() => ProductUseCase(injector()));
  }
}
