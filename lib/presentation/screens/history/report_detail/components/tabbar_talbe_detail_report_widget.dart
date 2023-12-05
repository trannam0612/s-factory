import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/standard_product_model.dart';
import 'package:s_factory/presentation/screens/history/report_detail/bloc/report_detail_bloc.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/table_detail_report_detail_widget.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/table_overview_report_detail_widget.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class TabBarTableDetailReportWidget extends StatefulWidget {
  TabBarTableDetailReportWidget({super.key});

  @override
  State<TabBarTableDetailReportWidget> createState() =>
      _TabBarTableDetailReportWidgetState();
}

class _TabBarTableDetailReportWidgetState
    extends State<TabBarTableDetailReportWidget> with TickerProviderStateMixin {
  late TabController tabController;

  ValueNotifier<int> pageIndex = ValueNotifier<int>(0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          TabBar(
            onTap: (int value) => pageIndex.value = value,
            tabs: const <Widget>[
              Tab(text: 'Đánh giá chi tiết'),
              Tab(text: 'Đánh giá tổng quan'),
            ],
            indicatorColor: ColorConstant.kPrimary01,
            labelColor: ColorConstant.kPrimary01,
            unselectedLabelColor: ColorConstant.kTextColor2,
            labelStyle: WowTextTheme.ts16w600(context),
          ),
          SizedBox(
            height: 24.h,
          ),
          ValueListenableBuilder<int>(
            valueListenable: pageIndex,
            builder: (BuildContext context, int value, Widget? child) =>
                BlocBuilder<ReportDetailBloc, ReportDetailState>(
              builder: (BuildContext context, ReportDetailState state) {
                final List<StandardProductModel> listStandardDetail =
                    state.reportDetailModel?.detailStandards ??
                        <StandardProductModel>[];
                final List<StandardProductModel> listStandardOverview =
                    state.reportDetailModel?.overviewStandards ??
                        <StandardProductModel>[];
                return SizedBox(
                  height: value == 0
                      ? (listStandardDetail.length + 2) * 50
                      : (listStandardOverview.length + 2) * 50,
                  child: const TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      TableDetailReportDetailWidget(),
                      TableOverviewReportDetailWidget()
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
