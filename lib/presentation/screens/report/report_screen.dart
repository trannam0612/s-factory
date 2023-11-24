import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/report/components/basic_info_widget.dart';
import 'package:s_factory/presentation/screens/report/components/button_confirm_report_widget.dart';
import 'package:s_factory/presentation/screens/report/components/input_basic_info_widget.dart';
import 'package:s_factory/presentation/screens/report/components/input_more_info_widget.dart';
import 'package:s_factory/presentation/screens/report/components/report_info_widget.dart';
import 'package:s_factory/presentation/screens/report/components/technical_drawing_widget.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
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
  @override
  void initState() {
    super.initState();
    _reportBloc = getIt();
    _reportBloc.add(InitListProductEvent(
      productionOrder: widget.productionOrder,
    ));
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
              const InputBasicInfoWidget(),
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
              const InputMoreInfoWidget(),
              SizedBox(
                height: 32.h,
              ),
              ButtonConfirmReportWidget(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
