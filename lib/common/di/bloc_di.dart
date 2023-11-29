import 'package:get_it/get_it.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/screens/auth/login/bloc/login_bloc.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/bloc/list_report_history_bloc.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/bloc/list_report_history_po_bloc.dart';
import 'package:s_factory/presentation/screens/history/report_detail/bloc/report_detail_bloc.dart';
import 'package:s_factory/presentation/screens/home/blocs/camera_scan_bloc/camera_scan_bloc.dart';
import 'package:s_factory/presentation/screens/home/blocs/home_bloc/home_bloc.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';

class BlocDI {
  BlocDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory<AppBloc>(() => AppBloc());
    injector.registerFactory<CameraScanBloc>(() => CameraScanBloc());
    injector.registerFactory<HomeBloc>(() => HomeBloc());
    injector.registerFactory<LoginBloc>(() => LoginBloc());
    injector.registerFactory<ReportBloc>(() => ReportBloc());
    injector
        .registerFactory<ListReportHistoryBloc>(() => ListReportHistoryBloc());
    injector.registerFactory<ListReportHistoryPOBloc>(
        () => ListReportHistoryPOBloc());
    injector.registerFactory<ReportDetailBloc>(() => ReportDetailBloc());
  }
}
