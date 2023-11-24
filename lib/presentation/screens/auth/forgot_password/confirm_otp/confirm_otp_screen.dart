import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';
import 'package:pinput/pinput.dart';

class ConfirmOTPScreen extends StatefulWidget {
  ConfirmOTPScreen({super.key});
  static const String pathRoute = 'confirmOTPRoute';

  @override
  State<ConfirmOTPScreen> createState() => _ConfirmOTPScreenState();
}

class _ConfirmOTPScreenState extends State<ConfirmOTPScreen> {
  final pinController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Set text programmatically
    pinController.setText('1222');

    /// Append typed character, useful if you are using custom keyboard
    pinController.append('1', 6);

    /// Delete last character
    pinController.delete();
  }

  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      appBar: const SAppBarWidget(
        title: 'Nhập OTP',
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(16.w),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Vui lòng nhập mã OTP đã được gửi tới số điện thoại 012345**** để xác nhận việc đổi mật khẩu.',
              style: WowTextTheme.ts16w400(context),
            ),
            Spacer(),
            Pinput(
              length: 6,
              onCompleted: (pin) => print(pin),
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
            ),
            SizedBox(
              height: 16.h,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '01:59',
                    style: WowTextTheme.ts16w400(context).copyWith(
                      color: ColorConstant.kPrimary01,
                    ),
                  ),
                ],
                text: 'Mã có hiệu lực trong ',
                style: WowTextTheme.ts16w400(context),
              ),
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
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
