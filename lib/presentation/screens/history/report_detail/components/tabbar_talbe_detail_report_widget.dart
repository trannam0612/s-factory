import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
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
        children: [
          TabBar(
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
          SizedBox(
            height: 700.h,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TableDetailReportDetailWidget(),
                TableOverviewReportDetailWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
