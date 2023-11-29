import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/info_overview_item_model.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class DetailTableReportOverviewWidget extends StatelessWidget {
  DetailTableReportOverviewWidget({super.key});
  final List<InfoOverviewItemModel> listItem = <InfoOverviewItemModel>[
    InfoOverviewItemModel(
        no: 'CT01',
        testItem: 'Thông mạch',
        standard: 'Thông mạch 2 đầu dây dẫn',
        modelNG: '0',
        note: 'Đây là ghi chú',
        result: 'Pass',
        measuringTool: 'Đồng hồ đo điện'),
    InfoOverviewItemModel(
        no: 'CT02',
        testItem: 'Thông mạch',
        standard: 'Thông mạch 2 đầu dây dẫn',
        modelNG: '0',
        note: 'Đây là ghi chú',
        result: 'Pass',
        measuringTool: 'Máy đo'),
    InfoOverviewItemModel(
        no: 'CT03',
        testItem: 'Độ kéo nén min, N  ',
        standard: '30',
        modelNG: '0',
        note: 'Đây là ghi chú',
        result: 'Pass',
        measuringTool: 'Đồng hồ đo điện'),
    InfoOverviewItemModel(
        no: 'CT04',
        testItem: 'Thiết diện, mm²',
        standard: '0.3',
        modelNG: '0',
        note: 'Đây là ghi chú',
        result: 'Pass',
        measuringTool: 'Pame'),
    InfoOverviewItemModel(
        no: 'CT05',
        testItem: 'A, mm',
        standard: '160 ± 10',
        modelNG: '0',
        note: 'Đây là ghi chú',
        result: 'Pass',
        measuringTool: 'Thước dây'),
    InfoOverviewItemModel(
        no: 'CT05',
        testItem: 'A, mm',
        standard: '160 ± 10',
        modelNG: '0',
        note: 'Đây là ghi chú',
        result: 'Pass',
        measuringTool: 'Thước dâyabcd123123123'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.kWhite,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(color: ColorConstant.kNeuTral02),
          columnWidths: <int, TableColumnWidth>{
            0: FixedColumnWidth(80.w),
            1: const IntrinsicColumnWidth(flex: 1),
            2: const IntrinsicColumnWidth(flex: 2),
            3: FixedColumnWidth(100.w),
            4: const IntrinsicColumnWidth(flex: 1),
            5: FixedColumnWidth(100.w),
            6: const IntrinsicColumnWidth(flex: 2),
          },
          children: <TableRow>[
            TableRow(
              decoration: const BoxDecoration(
                color: ColorConstant.kSupportInfo,
              ),
              children: <Widget>[
                _buildTitleTableWidget(context, value: 'STT'),
                _buildTitleTableWidget(context, value: 'Hạng mục kiểm tra'),
                _buildTitleTableWidget(context, value: 'Tiêu chuẩn'),
                _buildTitleTableWidget(context, value: 'Mẫu NG'),
                _buildTitleTableWidget(context, value: 'Ghi chú'),
                _buildTitleTableWidget(context, value: 'Kết quả'),
                _buildTitleTableWidget(context, value: 'Công cụ đo'),
              ],
            ),
            ...List<TableRow>.generate(
              listItem.length,
              (int index) => TableRow(
                decoration: BoxDecoration(
                  color: index == 3 || index == listItem.length
                      ? ColorConstant.kSupportInfo
                      : ColorConstant.kWhite,
                ),
                children: <Widget>[
                  _buildValueTableWidget(
                    context,
                    bgColor: ColorConstant.kSupportInfo,
                    value: listItem[index].no ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    bgColor: ColorConstant.kSupportInfo,
                    value: listItem[index].testItem ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    bgColor: ColorConstant.kSupportInfo,
                    value: listItem[index].standard ?? '',
                  ),
                  _buildValueTableWidget(context,
                      value: listItem[index].modelNG ?? '', isPass: true),
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].note ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].result ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    bgColor: ColorConstant.kSupportInfo,
                    value: listItem[index].measuringTool ?? '',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _buildTitleTableWidget(
    BuildContext context, {
    required String value,
  }) =>
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          value,
          style: WowTextTheme.ts14w600(context),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
  Widget _buildValueTableWidget(
    BuildContext context, {
    Color? bgColor,
    bool? isPass,
    required String value,
  }) =>
      Container(
        padding: const EdgeInsets.all(15.0),
        color: bgColor ?? ColorConstant.kWhite,
        child: Text(
          value,
          style: WowTextTheme.ts14w400(context).copyWith(
              color: isPass == null
                  ? isPass == null
                      ? null
                      : ColorConstant.kSupportError2
                  : ColorConstant.kSupportSuccess),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
}
