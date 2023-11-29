import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/item_inpection_report_model%20.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_back_button_widget%20.dart';

class InfoBasicReportWidget extends StatelessWidget {
  const InfoBasicReportWidget({super.key, required this.item});
  final ItemInpectionReportModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleInfoWidget(
                context,
                title: 'PO',
                value: item.name,
              ),
              SizedBox(
                width: 24.w,
              ),
              _buildTitleInfoWidget(
                context,
                title: 'Lot',
                value: item.lot,
              ),
              SizedBox(
                width: 24.w,
              ),
              _buildTitleInfoWidget(
                context,
                title: 'AQL',
                value: item.status,
                colorValue: ColorConstant.kSupportSuccess,
              ),
              SizedBox(
                width: 24.w,
              ),
              _buildTitleInfoWidget(
                context,
                title: 'Mã số',
                value: item.status,
                colorValue: ColorConstant.kSupportSuccess,
              ),
              SizedBox(
                width: 24.w,
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: ColorConstant.kSupportSuccess.withOpacity(0.1),
                ),
                child: Text(
                  item.status ?? '',
                  style: WowTextTheme.ts12w600(context).copyWith(
                    color: ColorConstant.kSupportSuccess,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
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
        text: TextSpan(children: <InlineSpan>[
          TextSpan(
            text: '$title: ',
            style: WowTextTheme.ts16w400(context),
          ),
          TextSpan(
            text: value,
            style: WowTextTheme.ts16w600(context).copyWith(
              color: colorValue,
            ),
          )
        ]));
  }
}
