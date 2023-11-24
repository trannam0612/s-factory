import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class InputEditValueWidget extends StatelessWidget {
  const InputEditValueWidget({
    super.key,
    required this.value,
    this.onTapConfirm,
  });
  final double value;
  final Function(String)? onTapConfirm;

  @override
  Widget build(BuildContext context) {
    final TextEditingController txtValue =
        TextEditingController(text: value.toString());

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
                  logi(message: 'onTapConfirm:${txtValue.text}');
                  onTapConfirm?.call(
                    txtValue.text,
                  );
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
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: WowTitleTextFieldWidget(
                    controller: txtValue,
                    title: 'Kết quả kiểm tra',
                  ),
                ),
                SizedBox(
                  width: 40.w,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
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
                              isSelected: true,
                              title: 'Pass',
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: _buildOptionSelectReportWidget(
                              context,
                              isSelected: false,
                              title: 'Fail',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildOptionSelectReportWidget(
    BuildContext context, {
    required bool isSelected,
    required String title,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          color: isSelected
              ? ColorConstant.kSupportSuccess.withOpacity(0.1)
              : ColorConstant.kWhite,
          borderRadius: BorderRadius.circular(4.w),
          border: Border.all(
            color: isSelected
                ? ColorConstant.kSupportSuccess
                : ColorConstant.kNeuTral02,
          )),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            isSelected ? SvgPaths.icSelectedRadio : SvgPaths.icUnselectRadio,
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
