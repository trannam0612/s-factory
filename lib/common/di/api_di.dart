import 'package:get_it/get_it.dart';

class ApiDI {
  ApiDI._();

  static Future<void> init(GetIt injector) async {
    // injector.registerFactory<AuthApi>(() => AuthApi(injector()));
  }
}
