import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/item_history_report_model.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_back_button_widget%20.dart';

class InfoOverviewHistoryReportWidget extends StatelessWidget {
  const InfoOverviewHistoryReportWidget({
    super.key,
    required this.item,
  });

  final ItemHistoryReportModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.kSupportInfo,
      padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SBackButtonWidget(
            title: item.po,
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleInfoWidget(
                  context,
                  title: 'Tên sản phẩm',
                  value: item.name,
                ),
                SizedBox(
                  height: 4.h,
                ),
                _buildTitleInfoWidget(
                  context,
                  title: 'Lot',
                  value: item.lot,
                ),
                SizedBox(
                  height: 4.h,
                ),
                _buildTitleInfoWidget(
                  context,
                  title: 'Trạng thái',
                  value: item.status,
                  colorValue: ColorConstant.kSupportSuccess,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  RichText _buildTitleInfoWidget(
    BuildContext context, {
    String? title,
    String? value,
    Color? colorValue,
  }) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: '$title: ',
            style: WowTextTheme.ts14w600(context),
            children: <InlineSpan>[
              TextSpan(
                text: value,
                style: WowTextTheme.ts14w600(context).copyWith(
                  color: colorValue,
                ),
              )
            ]));
  }
}
