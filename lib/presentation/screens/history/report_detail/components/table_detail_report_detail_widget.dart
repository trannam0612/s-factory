import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/standard_product_model.dart';
import 'package:s_factory/presentation/screens/history/report_detail/bloc/report_detail_bloc.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class TableDetailReportDetailWidget extends StatefulWidget {
  const TableDetailReportDetailWidget({
    super.key,
  });

  @override
  State<TableDetailReportDetailWidget> createState() =>
      _TableDetailReportDetailWidgetState();
}

class _TableDetailReportDetailWidgetState
    extends State<TableDetailReportDetailWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.kWhite,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<ReportDetailBloc, ReportDetailState>(
          builder: (BuildContext context, ReportDetailState state) {
            final List<StandardProductModel> listProduct =
                state.reportDetailModel?.detailStandards ??
                    <StandardProductModel>[];
            final List<String> listSerial =
                state.reportDetailModel?.sampleSerials ?? <String>[];
            logi(message: 'listProduct:${listProduct.length}');
            return DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) => ColorConstant.kSupportInfo,
              ),
              dataRowColor: MaterialStateProperty.all(Colors.green),
              columnSpacing: 0,
              horizontalMargin: 0,
              border: TableBorder.all(
                color: ColorConstant.kNeuTral02,
              ),
              columns: <DataColumn>[
                // _buildTitleTableWidget(context, value: 'STT'),
                _buildTitleTableWidget(context, value: 'Hạng mục kiểm tra'),
                _buildTitleTableWidget(context, value: 'Tiêu chuẩn'),
                ...List<DataColumn>.generate(listSerial.length, ((int index) {
                  return _buildTitleTableWidget(context,
                      value: listSerial[index]);
                })),
                _buildTitleTableWidget(context, value: 'Kết quả'),
                _buildTitleTableWidget(context, value: 'Công cụ đo'),
              ],
              dataRowMaxHeight: 50,
              dataRowMinHeight: 30,
              rows: List<DataRow>.generate(
                listProduct.length,
                (int index) => _buildDataRow(
                  index,
                  listProduct[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  DataRow _buildDataRow(int index, StandardProductModel data) {
    final List<SampleStandardModel> listStandardValue =
        data.sample ?? <SampleStandardModel>[];
    return DataRow(
      color: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => ColorConstant.kSupportInfo,
      ),
      cells: <DataCell>[
        // _buildValueTableWidget(
        //   context,
        //   value: '${data.type}0${index + 1}',
        //   bgColor: ColorConstant.kSupportInfo,
        // ),
        _buildValueTableWidget(
          context,
          value: data.name.clearSpace() ?? '',
          bgColor: ColorConstant.kSupportInfo,
          width: 300.w,
        ),
        _buildValueTableWidget(
          context,
          value: data.standard.clearSpace() ?? '',
          bgColor: ColorConstant.kSupportInfo,
          width: 200.w,
        ),
        ...List<DataCell>.generate(
          listStandardValue.length,
          (int index) {
            late String? newValue;
            final String? note = listStandardValue[index].note;
            final num? value = listStandardValue[index].value;
            final ReportStandardResult? result =
                listStandardValue[index].result;

            if (value != null) {
              newValue = value.toString();
            } else {
              if (result != null) {
                newValue = result.value;
              } else {
                newValue = '';
              }
            }
            return _buildValueTableWidget(
              context,
              isPass: listStandardValue[index].result,
              value: '$newValue',
              bgColor: ColorConstant.kWhite,
              note: note,
            );
          },
        ),
        _buildPOStatusCellWidget(
          context,
          value: data.result?.value ?? '',
          bgColor: ColorConstant.kWhite,
          isPass: data.result,
          onTap: () {},
        ),
        _buildValueTableWidget(
          context,
          value: data.tool ?? '',
          bgColor: ColorConstant.kSupportInfo,
        ),
      ],
    );
  }

  DataColumn _buildTitleTableWidget(
    BuildContext context, {
    required String value,
  }) =>
      DataColumn(
        label: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          alignment: Alignment.center,
          child: Text(
            value,
            style: WowTextTheme.ts14w600(context),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );

  DataCell _buildValueTableWidget(
    BuildContext context, {
    Color? bgColor,
    ReportStandardResult? isPass,
    required String value,
    String? note,
    double? width,
  }) =>
      DataCell(
        Tooltip(
          triggerMode: TooltipTriggerMode.tap,
          enableFeedback: false,
          message: note ?? '',
          padding: EdgeInsets.all(18.w),
          decoration: BoxDecoration(
              color: ColorConstant.kPrimary02,
              borderRadius: BorderRadius.circular(8.w)),
          textStyle: WowTextTheme.ts14w600(context).copyWith(),
          child: Container(
            width: width,
            foregroundDecoration: note != null && note.isNotEmpty == true
                ? const BadgeDecoration(
                    badgeColor: ColorConstant.kSupportWarning,
                    badgeSize: 15,
                  )
                : null,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            color: bgColor,
            child: SizedBox.expand(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: WowTextTheme.ts14w400(context).copyWith(
                      color: isPass != null
                          ? isPass == ReportStandardResult.fail
                              ? ColorConstant.kSupportError2
                              : ColorConstant.kSupportSuccess
                          : null),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      );

  DataCell _buildPOStatusCellWidget(
    BuildContext context, {
    Color? bgColor,
    ReportStandardResult? isPass,
    required String value,
    Function()? onTap,
  }) =>
      DataCell(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          color: bgColor,
          child: SizedBox.expand(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: WowTextTheme.ts14w400(context)
                    .copyWith(color: isPass?.color),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        onTap: onTap,
      );
}

class BadgeDecoration extends Decoration {
  final Color badgeColor;
  final double badgeSize;
  final TextSpan? textSpan;

  const BadgeDecoration(
      {required this.badgeColor, required this.badgeSize, this.textSpan});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _BadgePainter(badgeColor, badgeSize, textSpan);
  }
}

class _BadgePainter extends BoxPainter {
  static const double CORNER_RADIUS = 4;
  final Color badgeColor;
  final double badgeSize;
  final TextSpan? textSpan;

  _BadgePainter(this.badgeColor, this.badgeSize, this.textSpan);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    canvas.save();
    canvas.translate(
        offset.dx + configuration.size!.width - badgeSize, offset.dy);
    canvas.drawPath(buildBadgePath(), getBadgePaint());
    // draw text
    // final hyp = math.sqrt(badgeSize * badgeSize + badgeSize * badgeSize);
    // final textPainter = TextPainter(
    //     text: textSpan,
    //     textDirection: TextDirection.ltr,
    //     textAlign: TextAlign.center);
    // textPainter.layout(minWidth: hyp, maxWidth: hyp);
    // final halfHeight = textPainter.size.height / 2;
    // final v = math.sqrt(halfHeight * halfHeight + halfHeight * halfHeight) +
    //     BASELINE_SHIFT;
    // canvas.translate(v, -v);
    // canvas.rotate(0.785398); // 45 degrees
    // textPainter.paint(canvas, Offset.zero);
    canvas.restore();
  }

  Paint getBadgePaint() => Paint()
    ..isAntiAlias = true
    ..color = badgeColor;

  Path buildBadgePath() => Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(RRect.fromLTRBAndCorners(0, 0, badgeSize, badgeSize,
            topRight: Radius.circular(CORNER_RADIUS))),
      Path()
        ..lineTo(0, badgeSize)
        ..lineTo(badgeSize, badgeSize)
        ..close());
}
