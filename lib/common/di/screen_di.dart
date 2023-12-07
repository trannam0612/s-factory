import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:s_factory/presentation/model/list_report_history_po_model.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/auth/account/account_screen.dart';
import 'package:s_factory/presentation/screens/auth/change_password/change_password_screen.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/change_password_forgot/change_password_forgot_screen.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/confirm_otp/verify_otp_screen.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/input_phone/input_phone_screen.dart';
import 'package:s_factory/presentation/screens/auth/login/login_screen.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/list_history_report_screen.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/list_report_history_po_screen.dart';
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

    injector.registerFactory<Widget>(() => InputPhoneScreen(),
        instanceName: InputPhoneScreen.pathRoute);

    // injector.registerFactory<Widget>(() => ConfirmOTPScreen(),
    //     instanceName: ConfirmOTPScreen.pathRoute);

    injector.registerFactoryParam<Widget, VerifyOTPScreenArg, dynamic>(
        (VerifyOTPScreenArg param1, param2) => VerifyOTPScreen(
              arg: param1,
            ),
        instanceName: VerifyOTPScreen.pathRoute);

    // injector.registerFactory<Widget>(() => const ReportScreen(),
    //     instanceName: ReportScreen.pathRoute);

    injector.registerFactoryParam<Widget, ReportScreenArg, dynamic>(
        (ReportScreenArg param1, param2) => ReportScreen(
              arg: param1,
            ),
        instanceName: ReportScreen.pathRoute);

    injector.registerFactory<Widget>(() => const ListHistoryReportScreen(),
        instanceName: ListHistoryReportScreen.pathRoute);

    injector.registerFactoryParam<Widget, ProductionOrderModel, dynamic>(
        (ProductionOrderModel param1, param2) => ListReportHistoryPOScreen(
              productionOrderModel: param1,
            ),
        instanceName: ListReportHistoryPOScreen.pathRoute);

    injector.registerFactoryParam<Widget, POReportModel, dynamic>(
        (POReportModel param1, param2) => ReportDetailScreen(
              poReportModel: param1,
            ),
        instanceName: ReportDetailScreen.pathRoute);
    // injector.registerFactoryParam<Widget, String, dynamic>(
    //   (String param1, param2) => SetNewPasswordScreen(),
    //   instanceName: SetNewPasswordScreen.pathRoute,
    // );

    injector.registerFactory<Widget>(() => SetNewPasswordScreen(),
        instanceName: SetNewPasswordScreen.pathRoute);
    injector.registerFactory<Widget>(() => ChangePasswordScreen(),
        instanceName: ChangePasswordScreen.pathRoute);
    injector.registerFactory<Widget>(() => AccountScreen(),
        instanceName: AccountScreen.pathRoute);
  }
}
