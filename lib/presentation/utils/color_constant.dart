import 'package:flutter/cupertino.dart';

class ColorConstant {
  factory ColorConstant() {
    return _appConfig;
  }

  ColorConstant._();

  static final ColorConstant _appConfig = ColorConstant._();

  static const Color kBlackColor = Color(0xFF000000);
  static const Color kBackgroundColor = Color(0xFFFDFDFD);
  static const Color kTextColor = Color(0xFF323232);
  static const Color kTextColor2 = Color(0xFFA0A5A9);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kPrimary01 = Color(0xFF00AEEF);
  static const Color kPrimary02 = Color(0xFFF7F7F9);
  static const Color kPrimary03 = Color(0xFF158AE7);
  static const Color kSupportSuccess = Color(0xFF00D18A);
  static const Color kSupportError = Color(0xFFFFF5F3);
  static const Color kSupportError2 = Color(0xFFEB5454);
  static const Color kSupportInfo = Color(0xFFF5F9FF);

  static const Color kNeuTral02 = Color(0xFFF2F2F2);
  static const Color kNeuTral04 = Color(0xFF929292);
}
