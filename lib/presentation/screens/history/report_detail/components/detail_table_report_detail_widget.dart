import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/info_detail_item_model.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class DetailTableReportDetailWidget extends StatelessWidget {
  DetailTableReportDetailWidget({super.key});
  final listItem = <InfoDetailItemModel>[
    InfoDetailItemModel(
        no: 'CT01',
        testItem: 'Thông mạch',
        standard: 'Thông mạch 2 đầu dây dẫn',
        item1: 'Pass',
        item2: 'Pass',
        item3: 'Pass',
        item4: 'Pass',
        item5: 'Pass',
        item6: 'Pass',
        item7: 'Pass',
        item8: 'Pass',
        result: 'Pass',
        measuringTool: 'Đồng hồ đo điện'),
    InfoDetailItemModel(
        no: 'CT02',
        testItem: 'Thông mạch',
        standard: 'Thông mạch 2 đầu dây dẫn',
        item1: '48.3',
        item2: '51.1',
        item3: '11.2',
        item4: '50.1',
        item5: '9.2',
        item6: '100',
        item7: '51.2',
        item8: '100',
        result: 'Pass',
        measuringTool: 'Máy đo'),
    InfoDetailItemModel(
        no: 'CT03',
        testItem: 'Độ kéo nén min, N  ',
        standard: '30',
        item1: '122',
        item2: '44',
        item3: '66',
        item4: '55',
        item5: '11',
        item6: '55',
        item7: '22',
        item8: '66',
        result: 'Pass',
        measuringTool: 'Đồng hồ đo điện'),
    InfoDetailItemModel(
        no: 'CT04',
        testItem: 'Thiết diện, mm²',
        standard: '0.3',
        item1: 'Pass',
        item2: 'Pass',
        item3: 'Pass',
        item4: 'Pass',
        item5: 'Pass',
        item6: 'Pass',
        item7: 'Pass',
        item8: 'Pass',
        result: 'Pass',
        measuringTool: 'Pame'),
    InfoDetailItemModel(
        no: 'CT05',
        testItem: 'A, mm',
        standard: '160 ± 10',
        item1: '2',
        item2: '444',
        item3: '22',
        item4: '11',
        item5: '22',
        item6: '2',
        item7: '44',
        item8: '111',
        result: 'Pass',
        measuringTool: 'Thước dây'),
    InfoDetailItemModel(
        no: 'CT05',
        testItem: 'A, mm',
        standard: '160 ± 10',
        item1: '233',
        item2: '4414',
        item3: '22',
        item4: '211',
        item5: '222',
        item6: '245',
        item7: '1',
        item8: '22',
        result: 'Pass',
        measuringTool: 'Thước dâyabcd123123123'),
  ];

  @override
  Widget build(BuildContext context) {
    final FixedColumnWidth sizeWithItem = FixedColumnWidth(80.w);
    return Container(
      color: ColorConstant.kWhite,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(color: ColorConstant.kNeuTral02),
          columnWidths: <int, TableColumnWidth>{
            0: sizeWithItem,
            1: const IntrinsicColumnWidth(flex: 2),
            2: const IntrinsicColumnWidth(flex: 2),
            3: sizeWithItem,
            4: sizeWithItem,
            5: sizeWithItem,
            6: sizeWithItem,
            7: sizeWithItem,
            8: sizeWithItem,
            9: sizeWithItem,
            10: sizeWithItem,
            11: sizeWithItem,
            12: const IntrinsicColumnWidth(flex: 2),
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
                _buildTitleTableWidget(context, value: 'M1'),
                _buildTitleTableWidget(context, value: 'M2'),
                _buildTitleTableWidget(context, value: 'M3'),
                _buildTitleTableWidget(context, value: 'M4'),
                _buildTitleTableWidget(context, value: 'M5'),
                _buildTitleTableWidget(context, value: 'M6'),
                _buildTitleTableWidget(context, value: 'M7'),
                _buildTitleTableWidget(context, value: 'M8'),
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
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].item1 ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].item2 ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].item3 ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].item4 ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].item5 ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].item6 ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].item7 ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listItem[index].item8 ?? '',
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
    required String value,
  }) =>
      Container(
        padding: const EdgeInsets.all(15.0),
        color: bgColor ?? ColorConstant.kWhite,
        child: Text(
          value,
          style: WowTextTheme.ts14w400(context),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
}
