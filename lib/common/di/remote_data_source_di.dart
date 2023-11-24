import 'package:get_it/get_it.dart';
import 'package:s_factory/data/datasource/remote/auth_remote_data_source.dart';
import 'package:s_factory/data/datasource/remote/product_remote_data_source%20.dart';

class RemoteDataSourceDI {
  RemoteDataSourceDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory(() => AuthRemoteDataSource(injector()));
    injector.registerFactory(() => ProductRemoteDataSource(injector()));
  }
}
