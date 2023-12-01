import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/home/home_screen.dart';
import 'package:s_factory/presentation/screens/report/components/basic_info_widget.dart';
import 'package:s_factory/presentation/screens/report/components/button_confirm_report_widget.dart';
import 'package:s_factory/presentation/screens/report/components/input_basic_info_widget.dart';
import 'package:s_factory/presentation/screens/report/components/input_more_info_widget.dart';
import 'package:s_factory/presentation/screens/report/components/report_info_widget.dart';
import 'package:s_factory/presentation/screens/report/components/technical_drawing_widget.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_cricel_avatar_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class ReportScreenArg {
  ReportScreenArg({
    this.productionOrder,
    this.listSerial,
  });

  final ProductionOrderModel? productionOrder;
  final List<String>? listSerial;
}

class ReportScreen extends StatefulWidget {
  ReportScreen({
    super.key,
    this.arg,
  });
  static const String pathRoute = 'reportRoute';
  final ReportScreenArg? arg;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late ReportBloc _reportBloc;
  late TextEditingController _txtProvider;
  late TextEditingController _txtDocument;
  late TextEditingController _txtModelNumber;
  late TextEditingController _txtNG;
  late TextEditingController _txtResult;
  late TextEditingController _txtNote;
  @override
  void initState() {
    super.initState();
    _reportBloc = getIt();
    _reportBloc.add(InitListProductEvent(
      productionOrder: widget.arg?.productionOrder,
      listSerial: widget.arg?.listSerial,
    ));
    _txtProvider = TextEditingController();
    _txtDocument = TextEditingController();
    _txtModelNumber = TextEditingController(
        text: (widget.arg?.listSerial?.length ?? 0).toString());
    _txtNG = TextEditingController();
    _txtResult = TextEditingController();
    _txtNote = TextEditingController();
  }

  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      appBar: SAppBarWidget(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SvgPicture.asset(
            SvgPaths.icLogo,
          ),
        ),
        leadingWidth: 150.w,
        action: <Widget>[
          Padding(
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
          )
        ],
      ),
      body: BlocProvider<ReportBloc>(
        create: (BuildContext context) => _reportBloc,
        child: MultiBlocListener(
          listeners: [
            BlocListener<ReportBloc, ReportState>(
              listenWhen: (ReportState previous, ReportState current) =>
                  previous.confirmReportState != current.confirmReportState,
              listener: (BuildContext context, ReportState state) {
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
                    getIt<NavigationService>().openDialog(
                      title: 'Thông báo',
                      content: 'Báo cáo thành công',
                      onTap: () {
                        getIt<NavigationService>().navigateToAndRemoveUntil(
                            HomeScreen.pathRoute,
                            (Route<dynamic> route) => false);
                      },
                    );
                    break;
                  default:
                }
              },
            ),
          ],
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 32.h,
              horizontal: 16.w,
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: <Widget>[
                  BasicInfoWidget(productionOrder: widget.arg?.productionOrder),
                  SizedBox(
                    height: 34.h,
                  ),
                  InputBasicInfoWidget(
                    txtProvider: _txtProvider,
                    txtDocument: _txtDocument,
                    txtModelNumber: _txtModelNumber,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  TechnicalDrawingWidget(
                      productionOrder: widget.arg?.productionOrder),
                  SizedBox(
                    height: 32.h,
                  ),
                  ReportInfoWidget(
                    productionOrder: widget.arg?.productionOrder,
                    listSerial: widget.arg?.listSerial,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  InputMoreInfoWidget(
                    txtNG: _txtNG,
                    txtNote: _txtNote,
                    txtResult: _txtResult,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  BlocBuilder<ReportBloc, ReportState>(
                    builder: (BuildContext context, ReportState state) {
                      return ValueListenableBuilder<int>(
                        valueListenable: currentPage,
                        builder: (BuildContext context, int valueIndexPage,
                                Widget? child) =>
                            ButtonConfirmReportWidget(
                          onTap: () {
                            final bool? validate =
                                _formKey.currentState?.validate();
                            logi(message: 'validate://');
                            _reportBloc.add(
                              ConfirmReportEvent(
                                validate: validate,
                                provider: _txtProvider.text,
                                document: _txtDocument.text,
                                modelNumber: _txtModelNumber.text,
                                ng: _txtNG.text,
                                result: _txtResult.text,
                                note: _txtNote.text,
                                productionOrder: widget.arg?.productionOrder,
                                reportType: valueIndexPage,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
