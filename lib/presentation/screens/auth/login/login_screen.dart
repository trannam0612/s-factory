import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/screens/auth/forgot_password/input_phone/input_phone_screen.dart';
import 'package:s_factory/presentation/screens/auth/login/bloc/login_bloc.dart';
import 'package:s_factory/presentation/screens/home/home_screen.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const String pathRoute = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _txtPhone;

  late TextEditingController _txtPassword;

  final LoginBloc loginBloc = getIt();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _txtPhone = TextEditingController(text: '0855234900');
    _txtPassword = TextEditingController(text: 'HungDN96');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _txtPhone.dispose();
    _txtPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      body: BlocProvider<LoginBloc>(
        create: (BuildContext context) => loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (LoginState previous, LoginState current) =>
              previous.loginState != current.loginState,
          listener: (BuildContext context, LoginState state) {
            logi(message: 'state.loginState${state.loginState}');
            switch (state.loginState) {
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
                    HomeScreen.pathRoute, (Route<dynamic> route) => false);

                break;
              default:
            }
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                SvgPicture.asset(SvgPaths.icLogo),
                const Spacer(),
                Text(
                  'Đăng nhập',
                  style: WowTextTheme.ts28w600(context),
                ),
                const Spacer(),
                WowTitleTextFieldWidget(
                  hintText: 'Tên đăng nhập',
                  requiredField: true,
                  controller: _txtPhone,
                ),
                SizedBox(
                  height: 32.h,
                ),
                WowTitleTextFieldWidget(
                  hintText: 'Mật khẩu',
                  obscureText: true,
                  requiredField: true,
                  controller: _txtPassword,
                  topSuffixItem: GestureDetector(
                    onTap: () {
                      getIt<NavigationService>()
                          .navigateTo(InputPhoneScreen.pathRoute);
                    },
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
                    children: <Widget>[
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
                  onClick: () {
                    loginBloc.add(HandleLoginEvent(
                      phone: _txtPhone.text,
                      password: _txtPassword.text,
                    ));
                  },
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
        ),
      ),
    );
  }
}
