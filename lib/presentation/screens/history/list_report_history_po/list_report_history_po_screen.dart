import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/bloc/list_report_history_po_bloc.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/components/info_overview_report_history_po_widget.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/components/list_report_history_po_widget.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_cricel_avatar_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class ListReportHistoryPOScreen extends StatefulWidget {
  ListReportHistoryPOScreen({
    super.key,
    required this.productionOrderModel,
  });
  static const String pathRoute = 'historyReportRoute';

  final ProductionOrderModel productionOrderModel;

  @override
  State<ListReportHistoryPOScreen> createState() =>
      _ListReportHistoryPOScreenState();
}

class _ListReportHistoryPOScreenState extends State<ListReportHistoryPOScreen> {
  late ListReportHistoryPOBloc _listReportHistoryPOBloc;
  @override
  void initState() {
    super.initState();
    _listReportHistoryPOBloc = getIt();
    _listReportHistoryPOBloc.add(GetListReportHistoryPOEvent(
      poId: widget.productionOrderModel.id,
    ));
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
      body: BlocProvider<ListReportHistoryPOBloc>(
        create: (BuildContext context) => _listReportHistoryPOBloc,
        child: BlocListener<ListReportHistoryPOBloc, ListReportHistoryPOState>(
          listener: (BuildContext context, ListReportHistoryPOState state) {
            switch (state.getListReportHistoryPOState) {
              case LoadState.loading:
                if (state.listReport?.isEmpty == true) {
                  context.read<AppBloc>().add(OnShowLoadingEvent());
                }

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

                break;
              default:
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InfoOverviewReportHistoryPOWidget(
                item: widget.productionOrderModel,
              ),
              SizedBox(
                height: 32.h,
              ),
              Expanded(child: ListReportHistoryPOWidget())
            ],
          ),
        ),
      ),
    );
  }
}
