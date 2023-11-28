import 'package:flutter/material.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/list_history_report_screen.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';

class TitleAndButtonReportHistoryWidget extends StatelessWidget {
  const TitleAndButtonReportHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BÁO CÁO KIỂM TRA',
              style: WowTextTheme.ts32w600(context),
            ),
          ],
        ),
        Positioned(
          right: 0,
          child: SButtonWidget(
            onClick: () {
              getIt<NavigationService>()
                  .navigateTo(ListHistoryReportScreen.pathRoute);
            },
            prefixIconPath: SvgPaths.icFileAlt,
            text: 'Lịch sử báo cáo',
            textStyle: WowTextTheme.ts14w600(context)
                .copyWith(color: ColorConstant.kPrimary01),
          ),
        )
      ],
    );
  }
}
