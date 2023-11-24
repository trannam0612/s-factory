import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/data/product_report_data.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class TableReportDetailWidget extends StatefulWidget {
  TableReportDetailWidget({
    super.key,
  });

  @override
  State<TableReportDetailWidget> createState() =>
      _TableReportDetailWidgetState();
}

class _TableReportDetailWidgetState extends State<TableReportDetailWidget> {
  late ReportBloc _reportBloc;
  @override
  void initState() {
    super.initState();
    _reportBloc = context.read();
  }

  @override
  Widget build(BuildContext context) {
    final FixedColumnWidth sizeWithItem = FixedColumnWidth(80.w);
    return Container(
      color: ColorConstant.kWhite,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<ReportBloc, ReportState>(
          builder: (BuildContext context, ReportState state) {
            final List<ProductReportData> listProduct =
                state.listProduct ?? <ProductReportData>[];
            logi(message: 'listProduct:${listProduct.length}');
            return Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(color: ColorConstant.kNeuTral02),
              defaultColumnWidth: sizeWithItem,
              columnWidths: <int, TableColumnWidth>{
                0: sizeWithItem,
                1: const IntrinsicColumnWidth(flex: 2),
                2: const IntrinsicColumnWidth(flex: 2),
                listProduct.length + 2 + 1: FixedColumnWidth(100.w),
                listProduct.length + 2 + 2: const IntrinsicColumnWidth(flex: 2),
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
                    ...List.generate(
                      listProduct.length,
                      (int index) => _buildTitleTableWidget(context,
                          value: 'M${index + 1}'),
                    ),
                    _buildTitleTableWidget(context, value: 'Kết quả'),
                    _buildTitleTableWidget(context, value: 'Công cụ đo'),
                  ],
                ),
                // ...List<TableRow>.generate(
                //   listProduct.length,
                //   (int index) {
                //     final List<StandardProductModel> listStandard =
                //         listProduct[index].listStandard ?? [];
                //     return TableRow(
                //       decoration: BoxDecoration(
                //         color: index == 3 || index == listProduct.length
                //             ? ColorConstant.kSupportInfo
                //             : ColorConstant.kSupportInfo,
                //       ),
                //       children: <Widget>[
                //         // ...List.generate(
                //         //   listStandard.length,
                //         //   (int idx) => _buildValueTableWidget(
                //         //     context,
                //         //     bgColor: ColorConstant.kSupportInfo,
                //         //     value: '${listStandard[idx].type}-$index',
                //         //   ),
                //         // ),
                //         ...List.generate(
                //           listProduct.length,
                //           (int idx) => _buildValueTableWidget(
                //             context,
                //             bgColor: ColorConstant.kSupportInfo,
                //             value: listProduct[idx].sta.toString(),
                //           ),
                //         ),
                //         // _buildValueTableWidget(
                //         //   context,
                //         //   bgColor: ColorConstant.kSupportInfo,
                //         //   value: '${listProduct[index].listStandard?.first.type}-$index',
                //         // ),
                //         // _buildValueTableWidget(
                //         //   context,
                //         //   bgColor: ColorConstant.kSupportInfo,
                //         //   value: listProduct[index].listStandard?.first.reviewType ?? '',
                //         // ),
                //         // _buildValueTableWidget(
                //         //   context,
                //         //   bgColor: ColorConstant.kSupportInfo,
                //         //   value: listProduct[index].listStandard?.first.standard ?? '',
                //         // ),
                //         // // ...List.generate(
                //         // //   listProduct.length,
                //         // //   (int idx) => _buildValueTableWidget(
                //         // //     context,
                //         // //     value: listProduct[index].listStandard?.first.value.toString()??'',
                //         // //     onTap: () {
                //         // //       getIt<NavigationService>().openBottomSheet(
                //         // //         bgColor: Colors.transparent,
                //         // //         widget: InputEditValueWidget(
                //         // //           value: listProduct[index].value,
                //         // //           onTapConfirm: (String newValue) {
                //         // //             _reportBloc.add(UpdateValueProductEvent(
                //         // //               value: newValue,
                //         // //               serial: ,
                //         // //               standardId: ,
                //         // //             ));
                //         // //             // listProduct[index] = widget
                //         // //             //     .listStandard[index]
                //         // //             //     .copyWith(value: double.parse(newValue));
                //         // //           },
                //         // //         ),
                //         // //       );
                //         // //     },
                //         // //   ),
                //         // // ),
                //         // _buildValueTableWidget(
                //         //   context,
                //         //   value: 'PASS',
                //         // ),
                //         // _buildValueTableWidget(
                //         //   context,
                //         //   bgColor: ColorConstant.kSupportInfo,
                //         //   value: listProduct[index].tool ?? '',
                //         // ),
                //       ],
                //     );
                //   },
                // )
              ],
            );
          },
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
