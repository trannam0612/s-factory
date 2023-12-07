import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nested/nested.dart';
import 'package:pinput/pinput.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/common/extensions/num_extension.dart';
import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/change_password_forgot/change_password_forgot_screen.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/confirm_otp/cubit/verify_otp_cubit.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/input_phone/cubit/phone_challege_cubit.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class VerifyOTPScreenArg {
  VerifyOTPScreenArg({
    required this.phoneNumber,
    required this.session,
  });

  final String phoneNumber;
  final String session;
}

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({
    super.key,
    required this.arg,
  });
  static const String pathRoute = 'verifyOTPRoute';

  final VerifyOTPScreenArg arg;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  late TextEditingController pinController;
  late VerifyOTPCubit _verifyOTPCubit;
  late PhoneChallegeCubit _phoneChallegeCubit;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyOTPCubit = getIt();
    _phoneChallegeCubit = getIt();
    pinController = TextEditingController();

    /// Set text programmatically
    pinController.setText('');

    /// Append typed character, useful if you are using custom keyboard
    pinController.append('1', 6);

    /// Delete last character
    pinController.delete();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _verifyOTPCubit.closeTimer();
    pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      bgPath: ImgPaths.imgBackground,
      backgroundColor: ColorConstant.kPrimary02,
      appBar: const SAppBarWidget(
        title: 'Nhập OTP',
        centerTitle: false,
      ),
      body: MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<VerifyOTPCubit>(
            create: (BuildContext context) => _verifyOTPCubit,
          ),
          BlocProvider<PhoneChallegeCubit>(
            create: (BuildContext context) => _phoneChallegeCubit,
          ),
        ],
        child: MultiBlocListener(
          listeners: <SingleChildWidget>[
            BlocListener<PhoneChallegeCubit, PhoneChallegeState>(
              listenWhen:
                  (PhoneChallegeState previous, PhoneChallegeState current) =>
                      previous.phoneChallegeState != current.phoneChallegeState,
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

                    getIt<NavigationService>().openDialog(
                      title: 'Thông báo',
                      content: 'Đã gửi lại mã OTP thành công.',
                    );
                    _verifyOTPCubit.closeTimer();

                    _verifyOTPCubit.initTimeOtp();

                    // getIt<NavigationService>().navigateToWithArgs(
                    //   routeName: VerifyOTPScreen.pathRoute,
                    //   args: _txtPhone.text,
                    // );

                    break;
                  default:
                }
              },
            ),
            BlocListener<VerifyOTPCubit, VerifyOTPState>(
              listenWhen: (VerifyOTPState previous, VerifyOTPState current) =>
                  previous.verifyOTPState != current.verifyOTPState,
              listener: (BuildContext context, VerifyOTPState state) {
                switch (state.verifyOTPState) {
                  case LoadState.loading:
                    context.read<AppBloc>().add(OnShowLoadingEvent());

                    break;
                  case LoadState.failure:
                    context.read<AppBloc>().add(OnHideLoadingEvent());
                    pinController.clear();
                    getIt<NavigationService>().openDialog(
                      title: 'Lỗi',
                      content: state.message,
                    );
                    break;
                  case LoadState.success:
                    context.read<AppBloc>().add(OnHideLoadingEvent());

                    getIt<NavigationService>().navigateToWithArgs(
                      routeName: SetNewPasswordScreen.pathRoute,
                    );

                    break;
                  default:
                }
              },
            ),
          ],
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
                      'Nhập mã OTP',
                      style: WowTextTheme.ts28w600(context),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    // Text(
                    //   'Vui lòng nhập mã OTP đã được gửi tới số điện thoại 012345**** để xác nhận việc đổi mật khẩu.',
                    //   style: WowTextTheme.ts16w400(context),
                    //   textAlign: TextAlign.center,
                    // ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                'Vui lòng nhập mã OTP đã được gửi tới số điện thoại ',
                            style: WowTextTheme.ts16w400(context).copyWith(
                              color: ColorConstant.kTextColor,
                            ),
                          ),
                          TextSpan(
                            text: widget.arg.phoneNumber.hidePhone(),
                            style: WowTextTheme.ts16w600(context).copyWith(
                              color: ColorConstant.kTextColor,
                            ),
                          ),
                          TextSpan(
                            text: ' để xác nhận việc đổi mật khẩu. ',
                            style: WowTextTheme.ts16w400(context).copyWith(
                              color: ColorConstant.kTextColor,
                            ),
                          ),
                        ],
                        style: WowTextTheme.ts16w400(context),
                      ),
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    Pinput(
                      controller: pinController,
                      length: 6,
                      onCompleted: (String pin) => print(pin),
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      defaultPinTheme: PinTheme(
                        textStyle: WowTextTheme.ts24w600(context),
                        width: 48.w,
                        height: 72.h,
                        decoration: BoxDecoration(
                          color: ColorConstant.kWhite,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    BlocBuilder<VerifyOTPCubit, VerifyOTPState>(
                      builder: (BuildContext context, VerifyOTPState state) {
                        final int time = state.timer ?? 0;
                        return RichText(
                          text: TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: time != 0 ? time.formatTime() : '',
                                style: WowTextTheme.ts16w400(context).copyWith(
                                  color: ColorConstant.kPrimary01,
                                ),
                              ),
                            ],
                            text: time != 0
                                ? 'Mã có hiệu lực trong '
                                : 'Mã OTP đã hết hiệu lực',
                            style: WowTextTheme.ts16w400(context),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    BlocBuilder<PhoneChallegeCubit, PhoneChallegeState>(
                      builder: (context, state) {
                        final String? session = state.session;
                        return SButtonWidget(
                          text: 'Gửi yêu cầu',
                          margin: EdgeInsets.zero,
                          width: double.infinity,
                          bgColor: ColorConstant.kPrimary01,
                          textStyle: WowTextTheme.ts14w600(context).copyWith(
                            color: ColorConstant.kWhite,
                          ),
                          onClick: () {
                            logi(
                                message: 'pinController:${pinController.text}');
                            _verifyOTPCubit.handleVerifyOTP(
                              pinController.text,
                              session ?? widget.arg.session,
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Gửi lại mã OTP',
                            style: WowTextTheme.ts16w400(context).copyWith(
                              color: ColorConstant.kPrimary01,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                logi(message: 'Gửi lại mã OTP');
                                _phoneChallegeCubit.handlePhoneChallege(
                                  widget.arg.phoneNumber,
                                );
                              },
                          ),
                        ],
                        text: 'Không nhận được mã OTP? ',
                        style: WowTextTheme.ts16w400(context),
                      ),
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
