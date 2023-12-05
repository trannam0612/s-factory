import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/list_report_history_po_model.dart';
import 'package:s_factory/presentation/screens/history/report_detail/report_detail_screen.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class ItemReportHistoryPOWidget extends StatelessWidget {
  const ItemReportHistoryPOWidget({
    super.key,
    this.item,
  });
  final POReportModel? item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<NavigationService>().navigateToWithArgs(
          routeName: ReportDetailScreen.pathRoute,
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
            // Row(
            //   children: [
            Expanded(
              child: Text(
                item?.code ?? '',
                style: WowTextTheme.ts16w600(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // SizedBox(
            //   width: 8.w,
            // ),
            // Text(
            //   item?.code ?? '',
            //   style: WowTextTheme.ts16w600(context).copyWith(
            //     color: ColorConstant.kSupportSuccess,
            //   ),
            // ),
            //   ],
            // ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    color: item?.status?.color?.withOpacity(0.1),
                  ),
                  child: Text(
                    item?.status?.value ?? '',
                    style: WowTextTheme.ts16w600(context).copyWith(
                      color: item?.status?.color,
                    ),
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
