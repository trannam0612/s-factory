import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/list_report_history_po_model.dart';
import 'package:s_factory/presentation/model/product_type_model.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/bloc/list_report_history_po_bloc.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/components/input_search_inspection_report_widget.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/components/item_report_history_po_widget.dart';
import 'package:s_factory/presentation/widgets/s_smart_listview_widget.dart';

class ListReportHistoryPOWidget extends StatelessWidget {
  ListReportHistoryPOWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ListReportHistoryPOBloc _bloc = context.read();
    return Column(
      children: <Widget>[
        Text(
          'DANH SÁCH BÁO CÁO KIỂM TRA',
          style: WowTextTheme.ts32w600(context),
        ),
        SizedBox(
          height: 24.h,
        ),
        InputSearchReportHistoryPOWidget(),
        SizedBox(
          height: 32.h,
        ),
        Expanded(
          child: BlocBuilder<ListReportHistoryPOBloc, ListReportHistoryPOState>(
            builder: (BuildContext context, ListReportHistoryPOState state) {
              final List<POReportModel> listReportHistory =
                  state.listReport ?? [];
              return SSmartListViewWidget<POReportModel>(
                padding: EdgeInsets.symmetric(
                  horizontal: 145.w,
                  vertical: 24.h,
                ),
                isShowLoading:
                    state.getListReportHistoryPOState == LoadState.loading,
                items: listReportHistory,
                itemBuilder: (BuildContext p0, POReportModel data) =>
                    ItemReportHistoryPOWidget(item: data),
                separatorBuilder: const SizedBox(
                  height: 4,
                ),
                onLoadMore: () {
                  _bloc.add(const LoadmoreListReportHistoryPOEvent());
                },
                onRefresh: () {
                  _bloc.add(
                      const LoadmoreListReportHistoryPOEvent(isRefresh: true));
                },
              );
            },
          ),
        )
        // ListView.separated(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: 145.w,
        //     vertical: 24.h,
        //   ),
        //   shrinkWrap: true,
        //   separatorBuilder: (BuildContext context, int index) => const SizedBox(
        //     height: 4,
        //   ),
        //   itemBuilder: (BuildContext context, int index) {
        //     return ItemReportHistoryPOWidget(item: listItem[index]);
        //   },
        //   itemCount: listItem.length,
        // ),
      ],
    );
  }
}
