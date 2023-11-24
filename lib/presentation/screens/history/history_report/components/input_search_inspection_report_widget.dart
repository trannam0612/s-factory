import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/scan/scan.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_text_field_widget.dart';

class InputSearchInpectionReportWidget extends StatelessWidget {
  const InputSearchInpectionReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 145.w),
      child: Row(
        children: [
          Expanded(
            child: STextFieldWidget(
              maxLength: 5,
              hintText: 'Nhập mã báo cáo',
              iconPath: SvgPaths.isSearch,
              customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    8.w,
                  ),
                  bottomLeft: Radius.circular(
                    8.w,
                  ),
                ),
                borderSide: const BorderSide(
                  color: ColorConstant.kNeuTral02,
                ), // BorderSide
              ),
            ),
          ),
          SButtonWidget(
            text: 'Tìm kiếm',
            margin: EdgeInsets.zero,
            onClick: () {
              getIt<NavigationService>().navigateTo(LoginScreen.pathRoute);
            },
            customBorderRadius: const BorderRadius.only(
              topRight: Radius.circular(
                8,
              ),
              bottomRight: Radius.circular(
                8,
              ),
            ),
            bgColor: ColorConstant.kPrimary01,
            textStyle: WowTextTheme.ts20w600(context)
                .copyWith(color: ColorConstant.kWhite),
          )
        ],
      ),
    );
  }
}
