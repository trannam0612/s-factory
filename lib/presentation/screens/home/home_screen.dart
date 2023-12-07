import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nested/nested.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/model/item_product_model.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/auth/account/account_screen.dart';
import 'package:s_factory/presentation/screens/home/blocs/home_bloc/home_bloc.dart';
import 'package:s_factory/presentation/screens/home/components/button_confirm_check_report_widget.dart';
import 'package:s_factory/presentation/screens/home/components/camera_scan_serial_widget.dart';
import 'package:s_factory/presentation/screens/home/components/input_number_serial_widget.dart';
import 'package:s_factory/presentation/screens/home/components/list_products_model_widget.dart';
import 'package:s_factory/presentation/screens/home/components/title_and_report_history_widget.dart';
import 'package:s_factory/presentation/screens/report/report_screen.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_cricel_avatar_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String pathRoute = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc = getIt();
  }

  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      isScroll: false,
      appBar: SAppBarWidget(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SvgPicture.asset(
            SvgPaths.icLogo,
          ),
        ),
        leadingWidth: 150.w,
        action: <Widget>[
          InkWell(
            onTap: () {
              getIt<NavigationService>().navigateTo(AccountScreen.pathRoute);
            },
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    32.w,
                  ),
                  color: ColorConstant.kPrimary02,
                ),
                child: Row(
                  children: <Widget>[
                    SCricleAvatarWidget(
                      size: 32.w,
                      urlImage:
                          'https://st.quantrimang.com/photos/image/2021/08/16/Anh-vit-cute-6.jpg',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SvgPicture.asset(SvgPaths.icMenu)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: BlocProvider<HomeBloc>(
        create: (BuildContext context) => homeBloc,
        child: MultiBlocListener(
          listeners: <SingleChildWidget>[
            BlocListener<HomeBloc, HomeState>(
              listener: (BuildContext context, HomeState state) {
                logi(message: 'state.loginState//${state.checkSerialState}');
                switch (state.checkSerialState) {
                  case LoadState.loading:
                    context.read<AppBloc>().add(OnShowLoadingEvent());

                    break;
                  case LoadState.failure:
                    context.read<AppBloc>().add(OnHideLoadingEvent());
                    getIt<NavigationService>().openDialog(
                      title: 'Lỗi',
                      content: state.message,
                      onTap: () {
                        getIt<NavigationService>().pop();
                      },
                    );
                    break;
                  case LoadState.success:
                    context.read<AppBloc>().add(OnHideLoadingEvent());

                    // getIt<NavigationService>().navigateToAndRemoveUntil(
                    //     HomeScreen.pathRoute, (Route<dynamic> route) => false);

                    break;
                  default:
                }
              },
            ),
            BlocListener<HomeBloc, HomeState>(
              listenWhen: (HomeState previous, HomeState current) =>
                  previous.confirmReportState != current.confirmReportState,
              listener: (BuildContext context, HomeState state) {
                switch (state.confirmReportState) {
                  case LoadState.loading:
                    context.read<AppBloc>().add(OnShowLoadingEvent());

                    break;
                  case LoadState.failure:
                    context.read<AppBloc>().add(OnHideLoadingEvent());
                    getIt<NavigationService>().openDialog(
                      title: 'Lỗi',
                      content: state.message,
                      onTap: () {
                        getIt<NavigationService>().pop();
                      },
                    );
                    break;
                  case LoadState.success:
                    context.read<AppBloc>().add(OnHideLoadingEvent());
                    final ProductionOrderModel? productionOrder =
                        state.productionOrderModel;

                    getIt<NavigationService>().navigateToWithArgs(
                      routeName: ReportScreen.pathRoute,
                      args: ReportScreenArg(
                        productionOrder: productionOrder,
                        listSerial: state.listProductModel
                            ?.map((ProductModel e) => e.uniqueCode ?? '')
                            .toList(),
                      ),
                    );

                    break;
                  default:
                }
              },
            ),
          ],
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: Column(
                    children: <Widget>[
                      const TitleAndButtonReportHistoryWidget(),
                      SizedBox(
                        height: 24.h,
                      ),
                      const CameraScanSerialWidget(),
                      InputNumberSerialWidget(),
                      Expanded(child: ListProductsModelWidget()),
                    ],
                  ),
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (BuildContext context, HomeState state) {
                  if (state.listProductModel?.isNotEmpty == true) {
                    return ButtonConfirmCheckReportWidget(
                      onTap: () {
                        homeBloc.add(ConfirmReportEvent());
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
