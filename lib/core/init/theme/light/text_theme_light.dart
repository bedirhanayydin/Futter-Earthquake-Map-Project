import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color/color_constants.dart';
import '../../../constants/font/font_constants.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight? get instance {
    _instace ??= TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();

  double _suffixSpace(double value) => value;

  TextStyle get headline1 => TextStyle(fontSize: 96.sp, fontWeight: FontWeight.w300, letterSpacing: _suffixSpace(-1.5));
  TextStyle get headline2 => TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w300, letterSpacing: _suffixSpace(-0.5));
  TextStyle get headline3 => TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w400);
  TextStyle get headline4 => TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w400, letterSpacing: _suffixSpace(0.25));
  TextStyle get headline5 => TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400);
  TextStyle get overline => TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, letterSpacing: _suffixSpace(1.5));
  TextStyle get intro_next => TextStyle(
      color: ColorConstants.instance.primaryText,
      fontSize: 13.sp,
      fontFamily: Fonts.Medium,
      letterSpacing: _suffixSpace(3.34));
  TextStyle get dropdownStyle =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: ColorConstants.instance.white);
}
