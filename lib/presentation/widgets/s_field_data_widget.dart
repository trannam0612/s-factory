import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class WowFieldDataWidget extends StatefulWidget {
  const WowFieldDataWidget({
    Key? key,
    this.title,
    this.requiredField = false,
    this.onTap,
    this.text,
    this.textColor,
  }) : super(key: key);

  final String? title;
  final bool requiredField;
  final Function()? onTap;
  final String? text;
  final Color? textColor;
  @override
  State<WowFieldDataWidget> createState() => _WowFieldDataWidgetState();
}

class _WowFieldDataWidgetState extends State<WowFieldDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.requiredField == true ? ' *' : '',
                style: WowTextTheme.ts14w600(context).copyWith(
                  color: ColorConstant.kSupportError2,
                ),
              ),
            ],
            text: widget.title,
            style: WowTextTheme.ts14w600(context).copyWith(
              color: ColorConstant.kTextColor,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        InkWell(
          onTap: widget.onTap,
          child: Container(
            padding: EdgeInsets.all(
              12.w,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorConstant.kNeuTral02,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.text ?? '',
                    style: WowTextTheme.ts16w400(context).copyWith(
                      color: widget.textColor ?? ColorConstant.kTextColor,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  SvgPaths.icChevronDown,
                  fit: BoxFit.scaleDown,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
