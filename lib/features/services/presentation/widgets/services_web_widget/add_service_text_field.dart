import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class AddServiceTextField extends StatelessWidget {
  AddServiceTextField({
    super.key,
    required this.hint,
    required this.maxLines,
    this.textInputFormatter,
    required this.controller,
  });
  String? hint;
  int? maxLines;
  TextInputFormatter? textInputFormatter;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.w(context) * 0.040,
      child: TextField(
        controller: controller,
        inputFormatters:
            textInputFormatter != null ? [textInputFormatter!] : [],

        maxLines: maxLines,
        cursorHeight: 15,
        enabled: true,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 15),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          hintText: hint,
          fillColor: AppColor.filledTextField,
          enabled: true,

          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 3.5, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
