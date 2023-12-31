import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/confirm_otp/verify_otp_screen.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/input_phone/cubit/phone_challege_cubit.dart';
import 'package:s_factory/presentation/screens/utils.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class InputPhoneScreen extends StatelessWidget {
  InputPhoneScreen({super.key});
  static const String pathRoute = 'inputPhoneRoute';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PhoneChallegeCubit _phoneChallegeCubit = getIt();
  final TextEditingController _txtPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      bgPath: ImgPaths.imgBackground,
      backgroundColor: ColorConstant.kPrimary02,
      body: BlocProvider<PhoneChallegeCubit>(
        create: (BuildContext context) => _phoneChallegeCubit,
        child: BlocListener<PhoneChallegeCubit, PhoneChallegeState>(
          listener: (BuildContext context, PhoneChallegeState state) {
            switch (state.phoneChallegeState) {
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
                final String session = state.session ?? '';

                getIt<NavigationService>().navigateToWithArgs(
                  routeName: VerifyOTPScreen.pathRoute,
                  args: VerifyOTPScreenArg(
                    phoneNumber: _txtPhone.text,
                    session: session,
                  ),
                );

                break;
              default:
            }
          },
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        'Quên mật khẩu',
                        style: WowTextTheme.ts28w600(context),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Điền số điện thoại của bạn để gửi yêu cầu đổi mật khẩu',
                        style: WowTextTheme.ts16w400(context),
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      WowTitleTextFieldWidget(
                        hintText: 'Số điện thoại',
                        requiredField: true,
                        controller: _txtPhone,
                        textInputType: TextInputType.phone,
                        validator: (String? text) =>
                            ValidatorUtils().validatorEmpty(
                          text,
                          title: 'Số điện thoại không được để trống',
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
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
                          final bool? isValidate =
                              _formKey.currentState?.validate();
                          if (isValidate == true) {
                            _phoneChallegeCubit
                                .handlePhoneChallege(_txtPhone.text);
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
      ),
    );
  }
}
