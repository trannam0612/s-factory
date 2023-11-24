import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class ButtonConfirmCheckReportWidget extends StatelessWidget {
  const ButtonConfirmCheckReportWidget({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstant.kPrimary01,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              30.w,
            ),
            topRight: Radius.circular(
              30.w,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'Báo cáo kiểm tra',
          style: WowTextTheme.ts20w600(context).copyWith(
            color: ColorConstant.kWhite,
          ),
        ),
      ),
    );
  }
}
