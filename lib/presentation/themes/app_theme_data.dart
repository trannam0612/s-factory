import 'package:flutter/material.dart';

import '../utils/color_constant.dart';

class AppThemeData {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor: ColorConstant.kBackgroundColor,
      // 0xFFF6F3F0
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConstant.kBackgroundColor,
        foregroundColor: Colors.white,
      ),
      // 0xFFAA2B2F

      bottomAppBarTheme:
          const BottomAppBarTheme(color: ColorConstant.kBackgroundColor),
      // 0xFFAA2B,

      inputDecorationTheme: InputDecorationTheme(
        fillColor: ColorConstant.kBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xFFADABAB)),
        ),
      ),
      // textTheme: GoogleFonts.publicSansTextTheme(),
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: ColorConstant.kBackgroundColor,
      // 0xFFF6F3F0
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConstant.kBackgroundColor,
        foregroundColor: Colors.white,
      ),
      // 0xFFAA2B2F

      bottomAppBarTheme:
          const BottomAppBarTheme(color: ColorConstant.kBackgroundColor),
      // 0xFFAA2B,

      inputDecorationTheme: InputDecorationTheme(
        fillColor: ColorConstant.kBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xFFADABAB)),
        ),
      ),
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      // accentColor: Colors.white,
      // accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,

      fontFamily: 'SF Pro Display',
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
          .copyWith(background: const Color(0xFF212121)),
      // pageTransitionsTheme: const PageTransitionsTheme(builders: {
      //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      //   TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      // }
      // ),
    );
  }
}
