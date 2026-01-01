import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class AddServiceTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextInputFormatter? textInputFormatter;
  final TextEditingController controller;

  const AddServiceTextField({
    super.key,
    required this.hint,
    required this.maxLines,
    this.textInputFormatter,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = ScreenSize.w(context);
    final double screenHeight = ScreenSize.h(context);


    final double dynamicHeight = (maxLines * 25.0).clamp(40, screenHeight * 0.2);

    return SizedBox(
      height: dynamicHeight,
      child: TextField(
        controller: controller,
        inputFormatters:
            textInputFormatter != null ? [textInputFormatter!] : [],
        maxLines: maxLines,
        cursorHeight: 18,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: screenWidth * 0.035), 
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.012,
            horizontal: screenWidth * 0.035,
          ),
          fillColor: AppColor.filledTextField,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 2.5, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
