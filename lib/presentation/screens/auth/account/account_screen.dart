import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/auth/change_password/change_password_screen.dart';
import 'package:s_factory/presentation/screens/auth/login/login_screen.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_back_button_widget%20.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});
  static const String pathRoute = 'accountPath';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      appBar: SAppBarWidget(
        leading: SBackButtonWidget(),
        title: 'Home',
        centerTitle: false,
      ),
      bgPath: ImgPaths.imgBackground,
      backgroundColor: ColorConstant.kPrimary02,
      body: Container(
        padding: EdgeInsets.all(16.w),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SizedBox(
            width: 500.w,
            child: Column(
              children: <Widget>[
                const Spacer(),
                SvgPicture.asset(
                  SvgPaths.icLogoApp,
                  width: 50.w,
                  height: 50.w,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'FACTORY',
                  style: WowTextTheme.ts32w700(context),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Account',
                  style: WowTextTheme.ts28w600(context),
                ),
                const Spacer(),
                SButtonWidget(
                  onClick: () {
                    getIt<NavigationService>()
                        .navigateTo(ChangePasswordScreen.pathRoute);
                  },
                  text: 'Đổi mật khẩu',
                  margin: EdgeInsets.zero,
                  width: double.infinity,
                  bgColor: ColorConstant.kPrimary01,
                  textStyle: WowTextTheme.ts14w600(context).copyWith(
                    color: ColorConstant.kWhite,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                SButtonWidget(
                  onClick: () {
                    getIt<NavigationService>().popUntil(LoginScreen.pathRoute);
                  },
                  text: 'Đăng xuất',
                  margin: EdgeInsets.zero,
                  width: double.infinity,
                  borderColor: ColorConstant.kPrimary01,
                  bgColor: ColorConstant.kPrimary02,
                  textStyle: WowTextTheme.ts14w600(context).copyWith(
                    color: ColorConstant.kPrimary01,
                  ),
                ),
                const Spacer(
                  flex: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
