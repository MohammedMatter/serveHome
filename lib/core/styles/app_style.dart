import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:serve_home/core/colors/app_color.dart';

class AppStyle {
  static final TextStyle body19 = TextStyle(
    color: Color(0xff0f3c4c),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 19,
  );

  static final TextStyle body17 = TextStyle(
    color: Color(0xff0f3c4c),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 17,
  );

  static final TextStyle body16 = TextStyle(
    color: Color(0xff0f3c4c),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static final TextStyle body30= TextStyle(
    color: Color(0xff0f3c4c),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );
  static final TextStyle body15 = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle body12 = TextStyle(
    color: Colors.black,
    fontSize: 12,
   fontWeight: FontWeight.w400
  );
  static final TextStyle body13 = TextStyle(
    color: AppColor.primary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle header = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    fontSize: 25 , 
  );
  static final TextStyle button = TextStyle(
    color: Colors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static final TextStyle subTitle = TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: const Color.fromARGB(255, 27, 27, 27),
  );
  static final TextStyle appBarTitle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );
  static final TextStyle hintTextStyle = TextStyle(
    fontSize: 14.7,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: const Color.fromARGB(255, 114, 110, 110),
  );
}
