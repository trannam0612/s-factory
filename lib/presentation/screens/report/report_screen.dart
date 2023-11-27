import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/data/product_report_data.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
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

class ReportScreen extends StatefulWidget {
  ReportScreen({
    super.key,
    this.productionOrder,
  });
  static const String pathRoute = 'reportRoute';
  final ProductionOrderModel? productionOrder;

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
      productionOrder: widget.productionOrder,
    ));
    _txtProvider = TextEditingController();
    _txtDocument = TextEditingController();
    _txtModelNumber = TextEditingController();
    _txtNG = TextEditingController();
    _txtResult = TextEditingController();
    _txtNote = TextEditingController();
  }

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
        child: BlocListener<ReportBloc, ReportState>(
          listenWhen: (ReportState previous, ReportState current) =>
              previous.confirmReportState != current.confirmReportState,
          listener: (context, state) {
            switch (state.confirmReportState) {
              case LoadState.loading:
                context.read<AppBloc>().add(OnShowLoadingEvent());

                break;
              case LoadState.failure:
                context.read<AppBloc>().add(OnHideLoadingEvent());
                getIt<NavigationService>().openDialog(
                  title: 'Lỗi',
                  content: state.message,
                );
                break;
              case LoadState.success:
                context.read<AppBloc>().add(OnHideLoadingEvent());
                getIt<NavigationService>().openDialog(
                  title: 'Thông báo',
                  content: 'Báo cáo thành công',
                );
                break;
              default:
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 32.h,
              horizontal: 16.w,
            ),
            child: Column(
              children: <Widget>[
                BasicInfoWidget(productionOrder: widget.productionOrder),
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
                TechnicalDrawingWidget(productionOrder: widget.productionOrder),
                SizedBox(
                  height: 32.h,
                ),
                ReportInfoWidget(productionOrder: widget.productionOrder),
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
                    final List<StandardProductReportData> listProduct =
                        state.listProduct ?? <StandardProductReportData>[];
                    final List<String> listSerial =
                        state.listSerial ?? <String>[];
                    return ButtonConfirmReportWidget(
                      onTap: () {
                        _reportBloc.add(
                          ConfirmReportEvent(
                            provider: _txtProvider.text,
                            document: _txtDocument.text,
                            modelNumber: _txtModelNumber.text,
                            ng: _txtNG.text,
                            result: _txtResult.text, note: _txtNote.text,
                            productionOrder: widget.productionOrder,

                            // body: POReportArgs(
                            //   poId: widget.productionOrder?.id,
                            //   note: _txtNote.text,
                            //   ngCount: 100,
                            //   refDocument: _txtDocument.text,
                            //   providerCode: _txtProvider.text,
                            //   poStatus: _txtResult.text,
                            //   sampleSerials: widget.productionOrder?.uniqueCodes,
                            //   standards: listProduct
                            //       .map(
                            //         (StandardProductReportData e) => Standard(
                            //             standardId: e.id,
                            //             result:
                            //                 e.result == true ? "Pass" : 'Fail',
                            //             sampleStandards: e.listStandardValue
                            //                 ?.map((StandardValueData e) =>
                            //                     SampleStandard(
                            //                       serial: e.serial,
                            //                       result: e.result == true
                            //                           ? "Pass"
                            //                           : 'Fail',
                            //                       value: e.value?.toInt(),
                            //                     ))
                            //                 .toList()),
                            //       )
                            //       .toList(),
                            // ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
