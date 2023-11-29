import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/list_report_history_po_screen.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class ItemResultWidget extends StatelessWidget {
  const ItemResultWidget({
    super.key,
    this.item,
  });
  final ProductionOrderModel? item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<NavigationService>().navigateToWithArgs(
          routeName: ListReportHistoryPOScreen.pathRoute,
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
              item?.poCode ?? '',
              style: WowTextTheme.ts16w600(context),
            ),
            Row(
              children: [
                Text(
                  item?.status?.title ?? '',
                  style: WowTextTheme.ts16w600(context).copyWith(
                    color: item?.status?.color,
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
