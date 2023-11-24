import 'package:flutter/material.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class StyleConstant {
  static const double kLineHeight2214 = 22 / 14;
  static const double kLineHeight21618 = 216 / 18;
  static const double kLineHeight1812 = 18 / 12;

  static const TextStyle kBodyText1TextStyle = TextStyle(
      color: ColorConstant.kTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.2,
      fontFamily: 'PlusJakartaSans');

  static const TextStyle kBodyText2TextStyle = TextStyle(
      color: ColorConstant.kTextColor,
      fontSize: 18,
      letterSpacing: 0.2,
      height: 1.4,
      fontWeight: FontWeight.w400,
      fontFamily: 'PlusJakartaSans');

  static const TextStyle kHeadline1TextStyle = TextStyle(
      color: ColorConstant.kTextColor,
      fontSize: 48,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'PlusJakartaSans');

  static const TextStyle kHeadline2TextStyle = TextStyle(
      color: ColorConstant.kTextColor,
      fontSize: 40,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'PlusJakartaSans');

  static const TextStyle kHeadline3TextStyle = TextStyle(
      color: ColorConstant.kTextColor,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'PlusJakartaSans');

  static const TextStyle kHeadline4TextStyle = TextStyle(
      color: ColorConstant.kTextColor,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'PlusJakartaSans');

  static const TextStyle kHeadline5TextStyle = TextStyle(
      color: ColorConstant.kTextColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'PlusJakartaSans');
}
