import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class BSSelectStandardStatusWidget extends StatelessWidget {
  const BSSelectStandardStatusWidget({
    super.key,
    required this.currentStatus,
    this.onTapConfirm,
  });
  final ReportStandardResult currentStatus;
  final Function(ReportStandardResult?)? onTapConfirm;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<ReportStandardResult?> isPass =
        ValueNotifier<ReportStandardResult?>(currentStatus);

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // alignment: Alignment.centerRight,
        // clipBehavior: Clip.none,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildButtonConfirmWidget(
                context,
                isConfirm: false,
              ),
              _buildButtonConfirmWidget(
                context,
                isConfirm: true,
                onTap: () {
                  logi(message: 'onTapConfirm:${isPass.value}');
                  // if (txtValue.text.isNotNullOrEmpty) {
                  //   onTapConfirm?.call(txtValue.text, null);
                  // } else {
                  onTapConfirm?.call(isPass.value);
                  // }
                },
              ),
            ],
          ),
          Container(
            height: 200.h,
            padding: EdgeInsets.symmetric(
              vertical: 30.h,
              horizontal: 16.w,
            ),
            width: double.infinity,
            color: ColorConstant.kWhite,
            child: Expanded(
              flex: 5,
              child: ValueListenableBuilder<ReportStandardResult?>(
                valueListenable: isPass,
                builder: (
                  BuildContext context,
                  ReportStandardResult? valuePass,
                  Widget? child,
                ) =>
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Đánh giá',
                      style: WowTextTheme.ts14w600(context).copyWith(
                        color: ColorConstant.kTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: _buildOptionSelectReportWidget(
                            context,
                            isSelected: valuePass == ReportStandardResult.pass,
                            buttonType: ReportStandardResult.pass,
                            onTap: () {
                              logi(message: 'true');
                              isPass.value = ReportStandardResult.pass;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: _buildOptionSelectReportWidget(
                            context,
                            isSelected: valuePass == ReportStandardResult.fail,
                            buttonType: ReportStandardResult.fail,
                            onTap: () {
                              logi(message: 'fail:$valuePass');

                              isPass.value = ReportStandardResult.fail;
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionSelectReportWidget(BuildContext context,
      {bool? isSelected,
      Function()? onTap,
      required ReportStandardResult buttonType}) {
    final String title =
        buttonType == ReportStandardResult.pass ? 'Pass' : 'Fail';
    final Color color = buttonType == ReportStandardResult.pass
        ? ColorConstant.kSupportSuccess
        : ColorConstant.kSupportError2;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
            color: isSelected == true
                ? color.withOpacity(0.2)
                : ColorConstant.kWhite,
            borderRadius: BorderRadius.circular(4.w),
            border: Border.all(
              color: isSelected == true ? color : ColorConstant.kNeuTral02,
            )),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              isSelected == true
                  ? SvgPaths.icSelectedRadio
                  : SvgPaths.icUnselectRadio,
              color: isSelected == true ? color : ColorConstant.kNeuTral03,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              title,
              style: WowTextTheme.ts14w400(context).copyWith(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonConfirmWidget(
    BuildContext context, {
    required bool isConfirm,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: () {
        if (isConfirm) {
          logi(message: '_buildButtonConfirmWidget');
          onTap?.call();
        } else {
          getIt<NavigationService>().pop();
          return;
        }
      },
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: isConfirm
              ? ColorConstant.kSupportSuccess
              : ColorConstant.kSupportError2,
        ),
        child: Row(
          children: <Widget>[
            Text(
              isConfirm ? 'Xác nhận' : 'Hủy',
              style: WowTextTheme.ts16w600(context).copyWith(
                color: ColorConstant.kWhite,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            SvgPicture.asset(
              isConfirm ? SvgPaths.icCheck : SvgPaths.icClose,
              color: ColorConstant.kWhite,
            )
          ],
        ),
      ),
    );
  }
}
