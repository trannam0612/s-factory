import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class SButtonWidget extends StatelessWidget {
  const SButtonWidget({
    Key? key,
    this.text,
    this.onClick,
    this.suffixIconPath,
    this.prefixIconPath,
    this.textStyle,
    this.bgColor = ColorConstant.kWhite,
    this.iconColor,
    this.borderColor,
    this.borderRadius,
    this.customBorderRadius,
    this.width,
    this.gradientBg,
    this.enabled = true,
    this.margin = const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
  }) : super(key: key);
  final String? text;
  final Function()? onClick;
  final String? suffixIconPath;
  final String? prefixIconPath;
  final TextStyle? textStyle;
  final Color bgColor;
  final Color? borderColor;
  final Color? iconColor;
  final Gradient? gradientBg;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool enabled;
  final double? width;
  final double? borderRadius;
  final BorderRadiusGeometry? customBorderRadius;

  @override
  Widget build(BuildContext context) {
    return _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    if (gradientBg != null && enabled) {
      return Stack(
        children: [
          Container(
            padding: padding,
            margin: margin,
            width: width,
            decoration: BoxDecoration(
              color: enabled ? bgColor : ColorConstant.kWhite,
              border: Border.all(color: borderColor ?? Colors.transparent),
              borderRadius: customBorderRadius ??
                  BorderRadius.circular(borderRadius ?? 8),
              gradient: gradientBg,
            ),
            child: _buildButtonContent(context),
          ),
          Positioned(
            top: margin.top,
            bottom: margin.bottom,
            left: margin.left,
            child: SvgPicture.asset(
              SvgPaths.icLogo,
              color: Colors.white.withOpacity(.1),
            ),
          )
        ],
      );
    }
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        decoration: BoxDecoration(
          color: enabled ? bgColor : ColorConstant.kWhite,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius:
              customBorderRadius ?? BorderRadius.circular(borderRadius ?? 8),
          gradient: enabled ? gradientBg : null,
        ),
        child: _buildButtonContent(context),
      ),
    );
  }

  Widget _buildButtonContent(BuildContext context) {
    if (text == null || text!.isEmpty) {
      return SvgPicture.asset(
        prefixIconPath ?? suffixIconPath ?? SvgPaths.icLogo,
        color: iconColor,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (prefixIconPath != null && prefixIconPath!.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              prefixIconPath!,
              color: textStyle?.color,
            ),
          ),
        Text(
          text ?? 'kEmptyString',
          style: enabled
              ? textStyle ??
                  WowTextTheme.ts14w400(context).copyWith(
                    color: ColorConstant.kTextColor,
                  )
              : WowTextTheme.ts14w400(context).copyWith(
                  color: ColorConstant.kTextColor,
                ),
        ),
        if (suffixIconPath != null && suffixIconPath!.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: SvgPicture.asset(
              suffixIconPath!,
              color: textStyle?.color ?? ColorConstant.kTextColor,
            ),
          ),
      ],
    );
  }
}
