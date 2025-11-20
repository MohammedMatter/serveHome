
import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.w(context) * 0.7,
      child: TextField(
        enabled: true,
        decoration: InputDecoration(
          hoverColor: AppColor.primary.withOpacity(
            0.05,
          ),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search users or bookings ....',
          filled: true,
          fillColor: AppColor.filledTextField,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }
}