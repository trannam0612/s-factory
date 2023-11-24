import 'package:flutter/material.dart';
import 'package:s_factory/extended_text_theme.dart';
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
