import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/data/product_report_data.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/model/standard_product_model.dart';
import 'package:s_factory/presentation/screens/report/components/table_report_detail_widget.dart';
import 'package:s_factory/presentation/screens/report/components/table_report_overview_widget.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class ReportInfoWidget extends StatefulWidget {
  const ReportInfoWidget({
    super.key,
    this.productionOrder,
    this.listSerial,
  });
  final ProductionOrderModel? productionOrder;

  final List<String>? listSerial;

  @override
  State<ReportInfoWidget> createState() => _ReportInfoWidgetState();
}

class _ReportInfoWidgetState extends State<ReportInfoWidget>
    with TickerProviderStateMixin {
  final ValueNotifier<int> pageIndex = ValueNotifier<int>(0);
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
                BlocBuilder<ReportBloc, ReportState>(
              builder: (BuildContext context, ReportState state) {
                final List<StandardProductReportData> listProductDetail =
                    state.listProductDetail ?? <StandardProductReportData>[];
                final List<StandardProductReportData> listProductOverView =
                    state.listProductOverView ?? <StandardProductReportData>[];
                return SizedBox(
                  height: value == 0
                      ? (listProductDetail.length + 2) * 50
                      : (listProductOverView.length + 2) * 50,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      TableReportDetailWidget(listSerial: widget.listSerial),
                      TableReportOverviewWidget(
                        listStandard: widget.productionOrder?.productType
                                ?.overviewStandards ??
                            <StandardProductModel>[],
                      ),
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
