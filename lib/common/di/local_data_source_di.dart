import 'package:get_it/get_it.dart';
import 'package:s_factory/data/datasource/local/auth_local_datasource.dart';

class LocalDataSourceDI {
  LocalDataSourceDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSource(preferences: injector()));
  }
}
