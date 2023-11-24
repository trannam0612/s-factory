import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class WowTitleTextFieldWidget extends StatefulWidget {
  const WowTitleTextFieldWidget({
    Key? key,
    this.title,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.requiredField = false,
    this.onChanged,
    this.customBorder,
    this.topSuffixItem,
    this.maxLine = 1,
    this.controller,
  }) : super(key: key);

  final String? title;
  final String? hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final bool requiredField;
  final Function(String?)? onChanged;
  final InputBorder? customBorder;
  final Widget? topSuffixItem;
  final int? maxLine;
  final TextEditingController? controller;

  @override
  State<WowTitleTextFieldWidget> createState() =>
      _WowTitleTextFieldWidgetState();
}

class _WowTitleTextFieldWidgetState extends State<WowTitleTextFieldWidget> {
  static final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: ColorConstant.kNeuTral02,
    ),
  );
  static final OutlineInputBorder focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: ColorConstant.kPrimary03,
    ),
  );

  late final ValueNotifier<bool> _obscureTextNotifier;

  @override
  void initState() {
    _obscureTextNotifier = ValueNotifier<bool>(widget.obscureText);
    super.initState();
  }

  @override
  void dispose() {
    _obscureTextNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                text: widget.title ?? widget.hintText,
                style: WowTextTheme.ts14w600(context).copyWith(
                  color: ColorConstant.kTextColor,
                ),
              ),
            ),
            widget.topSuffixItem ?? const SizedBox.shrink()
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _obscureTextNotifier,
          builder: (_, bool obscureText, __) {
            return TextField(
              controller: widget.controller,
              style: WowTextTheme.ts16w400(context).copyWith(
                color: ColorConstant.kTextColor,
              ),
              keyboardType: widget.textInputType,
              obscureText: obscureText,
              onChanged: widget.onChanged,
              textAlignVertical: TextAlignVertical.center,
              maxLines: widget.maxLine,
              decoration: InputDecoration(
                focusedBorder: widget.customBorder ?? focusBorder,
                enabledBorder: widget.customBorder ?? border,
                disabledBorder: widget.customBorder ?? border,
                border: widget.customBorder ?? border,
                hintText: widget.hintText,
                hintStyle: WowTextTheme.ts16w400(context).copyWith(
                  color: ColorConstant.kNeuTral04,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                labelStyle: WowTextTheme.ts14w600(context)
                    .copyWith(color: ColorConstant.kNeuTral02, height: 15),
                // focusedBorder: border,
                // alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                floatingLabelStyle: WowTextTheme.ts14w600(context).copyWith(
                  color: ColorConstant.kNeuTral04,
                ),
                suffixIcon: widget.obscureText
                    ? ValueListenableBuilder<bool>(
                        valueListenable: _obscureTextNotifier,
                        builder: (_, bool enabled, __) {
                          return GestureDetector(
                            onTap: () {
                              _obscureTextNotifier.value =
                                  !_obscureTextNotifier.value;
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(enabled
                                    ? SvgPaths.icVisibility
                                    : SvgPaths.icVisibility),
                              ],
                            ),
                          );
                        },
                      )
                    : null,
              ),
              // decoration: InputDecoration(
              //   focusedBorder: Border,
              //   enabledBorder: border,
              //   border: border,
              //   hintText: widget.hintText,
              //   hintStyle: ExtendedTextTheme.body14MedTextStyle(context).copyWith(
              //     color: ColorConstant.kNeutral300Color,
              //   ),
              //   disabledBorder: border,
              //   contentPadding: const EdgeInsets.only(
              //       left: 20, right: 15, top: 10, bottom: 10),
              // ),
            );
          },
        ),
      ],
    );
  }
}
