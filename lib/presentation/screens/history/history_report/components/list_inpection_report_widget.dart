import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/item_inpection_report_model%20.dart';
import 'package:s_factory/presentation/screens/history/history_report/components/input_search_inspection_report_widget.dart';
import 'package:s_factory/presentation/screens/history/history_report/components/item_inpection_report_widget.dart';

class ListInpectionReportWidget extends StatelessWidget {
  ListInpectionReportWidget({super.key});
  final List<ItemInpectionReportModel> listItem = [
    ItemInpectionReportModel(
        po: 'PO-12313213213213213213213',
        status: 'PASS',
        createBy: 'Trần Đức Nam',
        createAt: '18-10-2023',
        lot: '3000',
        supplier: 'Công ty CP Đông Á',
        nG: '5',
        name: '3004010330- Bộ dây điện VĐT KAD-N69 v2 (PC)',
        note: 'Ghi chú',
        numberModel: '200',
        documentName:
            'Lorem ipsum dolor sit amet consectetur. Eu non arcu ut morbi sed.'),
    ItemInpectionReportModel(
        po: 'PO-12313213213213213213213',
        status: 'PASS',
        createBy: 'Trần Đức Nam',
        createAt: '18-10-2023',
        lot: '3000',
        supplier: 'Công ty CP Đông Á',
        nG: '5',
        name: '3004010330- Bộ dây điện VĐT KAD-N69 v2 (PC)',
        note: 'Ghi chú',
        numberModel: '200',
        documentName:
            'Lorem ipsum dolor sit amet consectetur. Eu non arcu ut morbi sed.'),
    ItemInpectionReportModel(
        po: 'PO-12313213213213213213213',
        status: 'PASS',
        createBy: 'Trần Đức Nam',
        createAt: '18-10-2023',
        lot: '3000',
        supplier: 'Công ty CP Đông Á',
        nG: '5',
        name: '3004010330- Bộ dây điện VĐT KAD-N69 v2 (PC)',
        note: 'Ghi chú',
        numberModel: '200',
        documentName:
            'Lorem ipsum dolor sit amet consectetur. Eu non arcu ut morbi sed.'),
    ItemInpectionReportModel(
        po: 'PO-12313213213213213213213',
        status: 'PASS',
        createBy: 'Trần Đức Nam',
        createAt: '18-10-2023',
        lot: '3000',
        supplier: 'Công ty CP Đông Á',
        nG: '5',
        name: '3004010330- Bộ dây điện VĐT KAD-N69 v2 (PC)',
        note: 'Ghi chú',
        numberModel: '200',
        documentName:
            'Lorem ipsum dolor sit amet consectetur. Eu non arcu ut morbi sed.'),
    ItemInpectionReportModel(
        po: 'PO-12313213213213213213213',
        status: 'PASS',
        createBy: 'Trần Đức Nam',
        createAt: '18-10-2023',
        lot: '3000',
        supplier: 'Công ty CP Đông Á',
        nG: '5',
        name: '3004010330- Bộ dây điện VĐT KAD-N69 v2 (PC)',
        note: 'Ghi chú',
        numberModel: '200',
        documentName:
            'Lorem ipsum dolor sit amet consectetur. Eu non arcu ut morbi sed.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'DANH SÁCH BÁO CÁO KIỂM TRA',
          style: WowTextTheme.ts32w600(context),
        ),
        SizedBox(
          height: 24.h,
        ),
        InputSearchInpectionReportWidget(),
        SizedBox(
          height: 32.h,
        ),
        ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 145.w,
            vertical: 24.h,
          ),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ItemInpectionReportWidget(item: listItem[index]);
          },
          itemCount: listItem.length,
        ),
      ],
    );
  }
}
