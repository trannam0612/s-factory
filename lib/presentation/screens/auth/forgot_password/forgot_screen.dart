import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String pathRoute = 'login';

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
              'Đăng nhập',
              style: WowTextTheme.ts28w600(context),
            ),
            const Spacer(),
            const WowTitleTextFieldWidget(
              hintText: 'Tên đăng nhập',
              requiredField: true,
            ),
            SizedBox(
              height: 32.h,
            ),
            WowTitleTextFieldWidget(
              hintText: 'Mật khẩu',
              obscureText: true,
              requiredField: true,
              topSuffixItem: GestureDetector(
                onTap: () {},
                child: Text(
                  'Quên mật khẩu?',
                  style: WowTextTheme.ts14w400(context),
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    SvgPaths.icUncheckOutline,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Ghi nhớ đăng nhập',
                    style: WowTextTheme.ts14w600(context),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            SButtonWidget(
              text: 'Đăng nhập',
              margin: EdgeInsets.zero,
              width: double.infinity,
              bgColor: ColorConstant.kPrimary01,
              textStyle: WowTextTheme.ts14w600(context).copyWith(
                color: ColorConstant.kWhite,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
