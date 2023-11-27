import 'package:get_it/get_it.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/login_response2.dart';
import 'package:s_factory/data/datasource/remote/responses/product/check_serial_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_report_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';

class ResponseDI {
  ResponseDI._();
  static Future<void> init(GetIt injector) async {
    injector.registerLazySingleton(() => LoginResponse2());
    injector.registerLazySingleton(() => CheckSerialResponse());
    injector.registerLazySingleton(() => ProductionOrderResponse());
    injector.registerLazySingleton(() => ProductionOrderReportResponse());
  }
}
