import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/detail_table_report_detail_widget.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/detail_table_report_overview_widget.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class DetailReportInfoWidget extends StatefulWidget {
  DetailReportInfoWidget({super.key});

  @override
  State<DetailReportInfoWidget> createState() => _DetailReportInfoWidgetState();
}

class _DetailReportInfoWidgetState extends State<DetailReportInfoWidget>
    with TickerProviderStateMixin {
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
            height: 400.h,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                DetailTableReportDetailWidget(),
                DetailTableReportOverviewWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
