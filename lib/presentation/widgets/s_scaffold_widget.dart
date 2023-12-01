import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_state.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class SScaffoldWidget extends StatelessWidget {
  const SScaffoldWidget({
    super.key,
    this.appBar,
    this.body,
    this.isScroll = true,
  });
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final bool? isScroll;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.kWhite,
      appBar: appBar,
      body: BlocProvider<AppBloc>.value(
          value: context.read<AppBloc>(),
          child: BlocBuilder<AppBloc, AppState>(
            buildWhen: (AppState previous, AppState current) =>
                previous.loadingStatus != current.loadingStatus,
            builder: (BuildContext context, AppState state) {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      logi(message: 'onTap');
                      // SystemChannels.textInput.invokeMethod('TextInput.hide');
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: SafeArea(
                      child: isScroll == true
                          ? SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: _buildBody(context))
                          : _buildBody(context),
                    ),
                  ),
                  if (state.loadingStatus == LoadingStatus.show)
                    Positioned.fill(
                        child: Container(
                      color: ColorConstant.kNeuTral02.withOpacity(0.5),
                      child: CupertinoActivityIndicator(
                        radius: 50.w,
                      ),
                    ))
                ],
              );
            },
          )),
    );
  }

  Widget _buildBody(BuildContext context) {
    return body ?? const SizedBox.shrink();
  }
}
