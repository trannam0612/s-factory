import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/model/list_report_history_po_model.dart';
import 'package:s_factory/presentation/screens/history/report_detail/bloc/report_detail_bloc.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/info_basic_detail_report_widget.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/info_detail_report_widget.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/tabbar_talbe_detail_report_widget.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/technical_drawing_detail_report_widget.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_cricel_avatar_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class ReportDetailScreen extends StatefulWidget {
  const ReportDetailScreen({
    super.key,
    required this.poReportModel,
  });
  static const String pathRoute = 'reportDetailRoute';

  final POReportModel? poReportModel;

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  late ReportDetailBloc _reportDetailBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reportDetailBloc = getIt();
    _reportDetailBloc.add(GetDetailReportEvent(id: widget.poReportModel?.id));
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
      body: BlocProvider<ReportDetailBloc>(
        create: (BuildContext context) => _reportDetailBloc,
        child: BlocListener<ReportDetailBloc, ReportDetailState>(
          listener: (BuildContext context, ReportDetailState state) {
            switch (state.getDetailReportState) {
              case LoadState.loading:
                context.read<AppBloc>().add(OnShowLoadingEvent());

                break;
              case LoadState.failure:
                context.read<AppBloc>().add(OnHideLoadingEvent());
                getIt<NavigationService>().openDialog(
                  title: 'Lỗi',
                  content: state.message,
                  onTap: () {
                    logi(message: 'message');
                    getIt<NavigationService>().pop();
                  },
                );
                break;
              case LoadState.success:
                context.read<AppBloc>().add(OnHideLoadingEvent());

                break;
              default:
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: <Widget>[
                InfoBasicReportWidget(),
                SizedBox(
                  height: 24.h,
                ),
                InfoDetailReportWidget(),
                SizedBox(
                  height: 32.h,
                ),
                const TechnicalDrawingReportWidget(),
                SizedBox(
                  height: 32.h,
                ),
                TabBarTableDetailReportWidget(),
                SizedBox(
                  height: 32.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
