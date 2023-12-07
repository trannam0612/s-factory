import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/change_password_forgot/cubit/change_password_forgot_cubit.dart';
import 'package:s_factory/presentation/screens/auth/login/login_screen.dart';
import 'package:s_factory/presentation/screens/utils.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class SetNewPasswordScreen extends StatelessWidget {
  SetNewPasswordScreen({super.key});
  static const String pathRoute = 'setNewPasswordScreenRoute';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ChangePasswordForgotCubit _changePasswordForgot = getIt();
  final TextEditingController _txtNewPassword = TextEditingController();
  final TextEditingController _txtReNewPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      bgPath: ImgPaths.imgBackground,
      backgroundColor: ColorConstant.kPrimary02,
      body: BlocProvider<ChangePasswordForgotCubit>(
        create: (BuildContext context) => _changePasswordForgot,
        child:
            BlocListener<ChangePasswordForgotCubit, ChangePasswordForgotState>(
          listener: (BuildContext context, ChangePasswordForgotState state) {
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
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
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
                      WowTitleTextFieldWidget(
                        hintText: 'Mật khẩu mới',
                        requiredField: true,
                        controller: _txtNewPassword,
                        textInputType: TextInputType.phone,
                        obscureText: true,
                        validator: (String? text) =>
                            ValidatorUtils().validatorPassword(
                          text,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      WowTitleTextFieldWidget(
                        hintText: 'Nhập lại mật khẩu mới',
                        requiredField: true,
                        controller: _txtReNewPassword,
                        textInputType: TextInputType.phone,
                        obscureText: true,
                        validator: (String? text) =>
                            ValidatorUtils().validatorRePassword(
                          text,
                          _txtNewPassword.text,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
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
                          final bool? isValidate =
                              _formKey.currentState?.validate();
                          if (isValidate == true) {
                            _changePasswordForgot.handleChangePasswordForgot(
                                _txtReNewPassword.text);
                          }
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SButtonWidget(
                        text: 'Đăng nhập',
                        margin: EdgeInsets.zero,
                        width: double.infinity,
                        bgColor: ColorConstant.kPrimary02,
                        textStyle: WowTextTheme.ts14w600(context).copyWith(
                          color: ColorConstant.kPrimary01,
                        ),
                        onClick: () {
                          getIt<NavigationService>()
                              .popUntil(LoginScreen.pathRoute);
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
      ),
    );
  }
}
