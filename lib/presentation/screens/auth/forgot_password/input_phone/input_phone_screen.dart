import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/confirm_otp/confirm_otp_screen.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class InputPhoneScreen extends StatelessWidget {
  const InputPhoneScreen({super.key});
  static const String pathRoute = 'inputPhoneRoute';

  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      body: Container(
        padding: EdgeInsets.all(16.w),
        width: double.infinity,
        child: Column(
          children: [
            SvgPicture.asset(SvgPaths.icLogo),
            const Spacer(),
            Text(
              'Quên mật khẩu',
              style: WowTextTheme.ts28w600(context),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Điền số điện thoại của bạn để gửi yêu cầu đổi mật khẩu',
              style: WowTextTheme.ts16w400(context),
            ),
            SizedBox(
              height: 32.h,
            ),
            const WowTitleTextFieldWidget(
              hintText: 'Số điện thoại',
              requiredField: true,
              textInputType: TextInputType.phone,
            ),
            const Spacer(
              flex: 4,
            ),
            SButtonWidget(
              text: 'Gửi yêu cầu',
              margin: EdgeInsets.zero,
              width: double.infinity,
              bgColor: ColorConstant.kPrimary01,
              textStyle: WowTextTheme.ts14w600(context).copyWith(
                color: ColorConstant.kWhite,
              ),
              onClick: () {
                getIt<NavigationService>()
                    .navigateTo(ConfirmOTPScreen.pathRoute);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
