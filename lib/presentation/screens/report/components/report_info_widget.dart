import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/report/components/table_report_detail_widget.dart';
import 'package:s_factory/presentation/screens/report/components/table_report_overview_widget.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class ReportInfoWidget extends StatefulWidget {
  const ReportInfoWidget({
    super.key,
    this.productionOrder,
  });
  final ProductionOrderModel? productionOrder;

  @override
  State<ReportInfoWidget> createState() => _ReportInfoWidgetState();
}

class _ReportInfoWidgetState extends State<ReportInfoWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
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
            height: 1000.h,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TableReportDetailWidget(),
                TableReportOverviewWidget(
                  listStandard:
                      widget.productionOrder?.productType?.overviewStandards ??
                          [],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
