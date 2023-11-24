import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class STextFieldWidget extends StatefulWidget {
  const STextFieldWidget({
    Key? key,
    this.enable = true,
    this.hintText = 'kEmptyString',
    this.onTextChanged,
    this.maxLines,
    this.maxLength,
    this.bgColor,
    this.customBorder,
    this.inputType = TextInputType.text,
    this.iconPath,
    this.controller,
  }) : super(key: key);
  final bool enable;
  final String hintText;
  final Function(String)? onTextChanged;
  final TextInputType inputType;
  final int? maxLines;
  final int? maxLength;
  final InputBorder? customBorder;
  final Color? bgColor;
  final String? iconPath;
  final TextEditingController? controller;

  @override
  State<STextFieldWidget> createState() => _STextFieldWidgetState();
}

class _STextFieldWidgetState extends State<STextFieldWidget> {
  static final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: ColorConstant.kTextColor,
    ), // BorderSide
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: WowTextTheme.ts14w600(context).copyWith(
        color: ColorConstant.kTextColor,
      ),
      controller: widget.controller,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: widget.bgColor ?? ColorConstant.kWhite,
        filled: true,
        counterText: '',
        focusedBorder: widget.customBorder ?? border,
        enabledBorder: widget.customBorder ?? border,
        enabled: widget.enable,
        disabledBorder: widget.customBorder ?? border,
        border: widget.customBorder ?? border,
        hintText: widget.hintText,
        hintStyle: WowTextTheme.ts16w400(context).copyWith(
          color: ColorConstant.kTextColor2,
        ),
        prefixIcon: widget.iconPath != null
            ? SvgPicture.asset(
                widget.iconPath ?? SvgPaths.isSearch,
                fit: BoxFit.scaleDown,
              )
            : null,
        contentPadding:
            const EdgeInsets.only(left: 20, right: 15, top: 10, bottom: 10),
      ),
      keyboardType: widget.inputType,
      onChanged: widget.onTextChanged,
    );
  }
}
