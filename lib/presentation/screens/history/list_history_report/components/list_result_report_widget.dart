import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/bloc/list_report_history_bloc.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/components/item_result_widget.dart';
import 'package:s_factory/presentation/widgets/s_smart_listview_widget.dart';

class ListResultReportWidget extends StatelessWidget {
  const ListResultReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ListReportHistoryBloc _historyBloc = context.read();
    return BlocConsumer<ListReportHistoryBloc, ListReportHistoryState>(
      builder: (BuildContext context, ListReportHistoryState state) {
        final List<ProductionOrderModel> listReportHistory =
            state.listReport ?? <ProductionOrderModel>[];

        return SSmartListViewWidget<ProductionOrderModel>(
          padding: EdgeInsets.symmetric(
            horizontal: 145.w,
            vertical: 24.h,
          ),
          isShowLoading: state.getListReportHistoryState == LoadState.loading,
          items: listReportHistory,
          itemBuilder: (BuildContext p0, ProductionOrderModel data) =>
              ItemResultWidget(item: data),
          separatorBuilder: const SizedBox(
            height: 4,
          ),
          onLoadMore: () {
            _historyBloc.add(const LoadmoreListReportHistoryEvent());
          },
          onRefresh: () {
            _historyBloc
                .add(const LoadmoreListReportHistoryEvent(isRefresh: true));
          },
        );
      },
      listener: (BuildContext context, ListReportHistoryState state) {},
    );
  }
}
