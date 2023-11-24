import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/item_history_report_model.dart';
import 'package:s_factory/presentation/screens/history/history_report/history_report_screen.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class ItemResultWidget extends StatelessWidget {
  const ItemResultWidget({
    super.key,
    this.item,
  });
  final ItemHistoryReportModel? item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<NavigationService>().navigateToWithArgs(
          routeName: HistoryReportScreen.pathRoute,
          args: item,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.w,
          ),
          color: ColorConstant.kSupportInfo,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item?.po ?? '',
              style: WowTextTheme.ts16w600(context),
            ),
            Row(
              children: [
                Text(
                  item?.status ?? '',
                  style: WowTextTheme.ts16w600(context).copyWith(
                    color: ColorConstant.kSupportSuccess,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                SvgPicture.asset(
                  SvgPaths.icChevronRight,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
