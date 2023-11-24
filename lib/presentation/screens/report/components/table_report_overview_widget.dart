import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/standard_product_model.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class TableReportOverviewWidget extends StatelessWidget {
  TableReportOverviewWidget({
    super.key,
    required this.listStandard,
  });
  final List<StandardProductModel> listStandard;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.kWhite,
      width: double.infinity,
      // padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(color: ColorConstant.kNeuTral02),
          columnWidths: <int, TableColumnWidth>{
            0: FixedColumnWidth(80.w),
            1: const IntrinsicColumnWidth(flex: 1),
            2: const IntrinsicColumnWidth(flex: 1),
            3: FixedColumnWidth(100.w),
            4: FixedColumnWidth(200.w),
            5: FixedColumnWidth(80.w),
            6: const IntrinsicColumnWidth(flex: 1),
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
              listStandard.length,
              (int index) => TableRow(
                decoration: BoxDecoration(
                  color: index == 3 || index == listStandard.length
                      ? ColorConstant.kSupportInfo
                      : ColorConstant.kSupportInfo,
                ),
                children: <Widget>[
                  _buildValueTableWidget(
                    context,
                    bgColor: ColorConstant.kSupportInfo,
                    value: '${listStandard[index].type}-$index',
                  ),
                  _buildValueTableWidget(
                    context,
                    bgColor: ColorConstant.kSupportInfo,
                    value: listStandard[index].name ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    bgColor: ColorConstant.kSupportInfo,
                    value: listStandard[index].standard ?? '',
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listStandard[index].standard ?? '',
                    onTap: () {},
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listStandard[index].description ?? '',
                    onTap: () {},
                  ),
                  _buildValueTableWidget(
                    context,
                    value: listStandard[index].description ?? '',
                    onTap: () {},
                  ),
                  _buildValueTableWidget(
                    context,
                    bgColor: ColorConstant.kSupportInfo,
                    value: listStandard[index].tool ?? '',
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
    Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
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
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
}
