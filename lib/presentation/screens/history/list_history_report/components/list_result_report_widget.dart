import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/presentation/model/item_history_report_model.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/components/item_result_widget.dart';

class ListResultReportWidget extends StatelessWidget {
  ListResultReportWidget({super.key});
  final List<ItemHistoryReportModel> listItem = [
    ItemHistoryReportModel(
      po: 'PO-12313213213213213213213',
      name: '3004010330- Bộ dây điện VĐT KAD-N69 v2 (PC)',
      lot: '3000',
      status: 'PASS',
    ),
    ItemHistoryReportModel(
      po: 'PO-22222222',
      status: 'FAIL',
      name: '11111- Bộ  ống nước 1000',
      lot: '2222',
    ),
    ItemHistoryReportModel(
      po: 'PO-888888',
      status: 'PENDING',
      name: '3004010330- Bộ Quần áo bảo hộ',
      lot: '111',
    ),
    ItemHistoryReportModel(
      po: 'PO-1123111',
      status: 'PASS',
      name:
          '3004010330- Tên sản phẩm rât dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài',
      lot: '44',
    ),
    ItemHistoryReportModel(
      po: 'PO-1',
      status: 'PASS',
      name: '3004010330- oke',
      lot: '111112',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: 145.w,
        vertical: 24.h,
      ),
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ItemResultWidget(item: listItem[index]);
      },
      itemCount: listItem.length,
    );
  }
}
