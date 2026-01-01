import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = (ScreenSize.w(context) * 0.7).clamp(250, 600); 
    double height = (ScreenSize.h(context) * 0.06).clamp(40, 55); 
    double borderRadius = (ScreenSize.w(context) * 0.02).clamp(6, 12);
    double iconSize = (ScreenSize.w(context) * 0.045).clamp(20, 28);
    double fontSize = (ScreenSize.w(context) * 0.035).clamp(12, 16);

    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        enabled: true,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          hoverColor: AppColor.primary.withOpacity(0.05),
          prefixIcon: Icon(Icons.search, size: iconSize),
          hintText: 'Search users or bookings ....',
          hintStyle: TextStyle(fontSize: fontSize * 0.9),
          filled: true,
          fillColor: AppColor.filledTextField,
          contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.2,
            horizontal: width * 0.02,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(width: 1),
          ),
        ),
      ),
    );
  }
}
