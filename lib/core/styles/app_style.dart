import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class AppStyle {
  static TextStyle body19(BuildContext context) => TextStyle(
        color: const Color(0xff0f3c4c),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: (ScreenSize.w(context) * 0.045).clamp(16, 22),
      );

  static TextStyle body17(BuildContext context) => TextStyle(
        color: const Color(0xff0f3c4c),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: (ScreenSize.w(context) * 0.042).clamp(15, 20),
      );

  static TextStyle body16(BuildContext context) => TextStyle(
        color: const Color(0xff0f3c4c),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: (ScreenSize.w(context) * 0.04).clamp(14, 18),
      );

  static TextStyle body30(BuildContext context) => TextStyle(
        color: const Color(0xff0f3c4c),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: (ScreenSize.w(context) * 0.065).clamp(25, 35),
      );

  static TextStyle body15(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: (ScreenSize.w(context) * 0.035).clamp(12, 17),
        fontWeight: FontWeight.w400,
      );

  static TextStyle body12(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: (ScreenSize.w(context) * 0.028).clamp(10, 14),
        fontWeight: FontWeight.w400,
      );

  static TextStyle body13(BuildContext context) => TextStyle(
        color: AppColor.primary,
        fontSize: (ScreenSize.w(context) * 0.03).clamp(11, 15),
        fontWeight: FontWeight.w400,
      );

  static TextStyle header(BuildContext context) => TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        fontSize: (ScreenSize.w(context) * 0.06).clamp(20, 30),
      );

  static TextStyle button(BuildContext context) => TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: (ScreenSize.w(context) * 0.04).clamp(14, 18),
      );

  static TextStyle subTitle(BuildContext context) => TextStyle(
        fontSize: (ScreenSize.w(context) * 0.03).clamp(10, 15),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: const Color.fromARGB(255, 27, 27, 27),
      );

  static TextStyle appBarTitle(BuildContext context) => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        fontSize: (ScreenSize.w(context) * 0.045).clamp(16, 22),
      );

  static TextStyle hintTextStyle(BuildContext context) => TextStyle(
        fontSize: (ScreenSize.w(context) * 0.035).clamp(12, 16),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: const Color.fromARGB(255, 114, 110, 110),
      );
}
