import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:s_factory/presentation/model/item_history_report_model.dart';
import 'package:s_factory/presentation/model/item_inpection_report_model%20.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/confirm_otp/confirm_otp_screen.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/input_phone/input_phone_screen.dart';
import 'package:s_factory/presentation/screens/auth/login/login_screen.dart';
import 'package:s_factory/presentation/screens/history/history_report/history_report_screen.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/list_history_report_screen.dart';
import 'package:s_factory/presentation/screens/history/report_detail/report_detail_screen.dart';
import 'package:s_factory/presentation/screens/home/home_screen.dart';
import 'package:s_factory/presentation/screens/report/report_screen.dart';

class ScreenDI {
  ScreenDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory<Widget>(() => const HomeScreen(),
        instanceName: HomeScreen.pathRoute);

    injector.registerFactory<Widget>(() => LoginScreen(),
        instanceName: LoginScreen.pathRoute);

    injector.registerFactory<Widget>(() => const InputPhoneScreen(),
        instanceName: InputPhoneScreen.pathRoute);

    injector.registerFactory<Widget>(() => ConfirmOTPScreen(),
        instanceName: ConfirmOTPScreen.pathRoute);

    // injector.registerFactory<Widget>(() => const ReportScreen(),
    //     instanceName: ReportScreen.pathRoute);

    injector.registerFactoryParam<Widget, ProductionOrderModel, dynamic>(
        (ProductionOrderModel param1, param2) => ReportScreen(
              productionOrder: param1,
            ),
        instanceName: ReportScreen.pathRoute);

    injector.registerFactory<Widget>(() => const ListHistoryReportScreen(),
        instanceName: ListHistoryReportScreen.pathRoute);

    injector.registerFactoryParam<Widget, ItemHistoryReportModel, dynamic>(
        (ItemHistoryReportModel param1, param2) => HistoryReportScreen(
              item: param1,
            ),
        instanceName: HistoryReportScreen.pathRoute);

    injector.registerFactoryParam<Widget, ItemInpectionReportModel, dynamic>(
        (ItemInpectionReportModel param1, param2) => ReportDetailScreen(
              item: param1,
            ),
        instanceName: ReportDetailScreen.pathRoute);
  }
}
