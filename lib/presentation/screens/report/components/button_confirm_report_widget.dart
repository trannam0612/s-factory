import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';

class ButtonConfirmReportWidget extends StatelessWidget {
  const ButtonConfirmReportWidget({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SButtonWidget(
      onClick: onTap,
      text: 'Xác nhận',
      width: 235.w,
      bgColor: ColorConstant.kPrimary01,
      textStyle: WowTextTheme.ts20w600(context).copyWith(
        color: ColorConstant.kWhite,
      ),
    );
  }
}
