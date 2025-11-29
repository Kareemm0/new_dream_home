import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../function/out_line_input_border.dart';
import 'app_text_style.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: "PublicSans",
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyle.style14.copyWith(color: AppColor.grey8),
      errorBorder: outLineInputBorder(
        color: AppColor.redED,
      ),
      enabledBorder: outLineInputBorder(),
      focusedBorder: outLineInputBorder(),
      disabledBorder: outLineInputBorder(),
      focusedErrorBorder: outLineInputBorder(
        color: AppColor.redED,
      ),
      outlineBorder: const BorderSide(),
      activeIndicatorBorder: const BorderSide(),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.greyD,
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.greyD,
      elevation: 0.0,
    ),
  );
}
