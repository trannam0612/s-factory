import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/app_routes.dart';
import 'package:s_factory/common/configs/network_config.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/screens/auth/login/login_screen.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/themes/app_theme_data.dart';

import 'common/configs/app_config.dart';

void main() async {
  await AppConfig().configApp(buildMode: BuildMode.staging);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (BuildContext context) => getIt<AppBloc>(),
      child: ScreenUtilInit(
        designSize: const Size(1024, 1366),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (_, Widget? child) {
          return MaterialApp(
            title: 'S Factory',
            navigatorKey: getIt<NavigationService>().navigatorKey,
            theme: AppThemeData.lightTheme,
            onGenerateRoute: AppRoute.getRoute,
            initialRoute: LoginScreen.pathRoute,
            // home: MyWidget(),
          );
        },
      ),
    );
  }
}
