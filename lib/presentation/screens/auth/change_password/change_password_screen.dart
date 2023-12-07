import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/screens/auth/change_password/cubit/change_password_cubit.dart';
import 'package:s_factory/presentation/screens/auth/login/login_screen.dart';
import 'package:s_factory/presentation/screens/utils.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  static const String pathRoute = 'changePasswordScreenRoute';
  final GlobalKey<FormState> _formCurrentKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formNewKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formReNewKey = GlobalKey<FormState>();
  final ChangePasswordCubit _changePasswordForgot = getIt();
  final TextEditingController _txtCurrentPassword = TextEditingController();
  final TextEditingController _txtNewPassword = TextEditingController();
  final TextEditingController _txtReNewPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      bgPath: ImgPaths.imgBackground,
      backgroundColor: ColorConstant.kPrimary02,
      body: BlocProvider<ChangePasswordCubit>(
        create: (BuildContext context) => _changePasswordForgot,
        child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
          listener: (BuildContext context, ChangePasswordState state) {
            switch (state.changePasswordForgottate) {
              case LoadState.loading:
                context.read<AppBloc>().add(OnShowLoadingEvent());

                break;
              case LoadState.failure:
                context.read<AppBloc>().add(OnHideLoadingEvent());
                getIt<NavigationService>().openDialog(
                  title: 'Lỗi',
                  content: state.message,
                );
                break;
              case LoadState.success:
                context.read<AppBloc>().add(OnHideLoadingEvent());

                getIt<NavigationService>().navigateToAndRemoveUntil(
                    LoginScreen.pathRoute, (route) => false);

                break;
              default:
            }
          },
          child: Container(
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
                      'Cập nhật mật khẩu',
                      style: WowTextTheme.ts28w600(context),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Cập nhật mật khẩu mới của bạn',
                      style: WowTextTheme.ts16w400(context),
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formCurrentKey,
                      child: WowTitleTextFieldWidget(
                        hintText: 'Mật khẩu cũ',
                        requiredField: true,
                        controller: _txtCurrentPassword,
                        obscureText: true,
                        validator: (String? text) =>
                            ValidatorUtils().validatorPassword(
                          text,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formNewKey,
                      child: WowTitleTextFieldWidget(
                        hintText: 'Mật khẩu mới',
                        requiredField: true,
                        controller: _txtNewPassword,
                        obscureText: true,
                        validator: (String? text) =>
                            ValidatorUtils().validatorPassword(
                          text,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formReNewKey,
                      child: WowTitleTextFieldWidget(
                        hintText: 'Nhập lại mật khẩu mới',
                        requiredField: true,
                        controller: _txtReNewPassword,
                        obscureText: true,
                        validator: (String? text) =>
                            ValidatorUtils().validatorRePassword(
                          text,
                          _txtNewPassword.text,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SButtonWidget(
                      text: 'Cập nhật mật khẩu',
                      margin: EdgeInsets.zero,
                      width: double.infinity,
                      bgColor: ColorConstant.kPrimary01,
                      textStyle: WowTextTheme.ts14w600(context).copyWith(
                        color: ColorConstant.kWhite,
                      ),
                      onClick: () {
                        final bool? isValidateNewPass =
                            _formNewKey.currentState?.validate();
                        final bool? isValidateCurrentPass =
                            _formCurrentKey.currentState?.validate();
                        final bool? isValidateReNewPass =
                            _formReNewKey.currentState?.validate();
                        if (isValidateNewPass == true &&
                            isValidateReNewPass == true &&
                            isValidateCurrentPass == true) {
                          _changePasswordForgot.handleChangePassword(
                            _txtCurrentPassword.text,
                            _txtReNewPassword.text,
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SButtonWidget(
                      text: 'Hủy',
                      margin: EdgeInsets.zero,
                      width: double.infinity,
                      bgColor: ColorConstant.kPrimary02,
                      textStyle: WowTextTheme.ts14w600(context).copyWith(
                        color: ColorConstant.kPrimary01,
                      ),
                      onClick: () {
                        getIt<NavigationService>().pop();
                      },
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
