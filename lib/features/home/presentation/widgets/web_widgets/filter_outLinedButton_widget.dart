import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class FilterOutLinedButtonWidget extends StatelessWidget {
  const FilterOutLinedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // قياسات ريسبونسف
    double borderRadius = (ScreenSize.w(context) * 0.02).clamp(6, 12);
    double fontSize = (ScreenSize.w(context) * 0.035).clamp(12, 16);
    double iconSize = (ScreenSize.w(context) * 0.05).clamp(18, 24);
    double sideWidth = (ScreenSize.w(context) * 0.002).clamp(0.15, 0.3);

    return OutlinedButton.icon(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColor.primary),
        side: WidgetStatePropertyAll(BorderSide(width: sideWidth, color: AppColor.primary)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: ScreenSize.w(context) * 0.03,
            vertical: ScreenSize.h(context) * 0.012,
          ),
        ),
      ),
      onPressed: () {},
      icon: Icon(Icons.filter_alt_outlined, size: iconSize),
      label: Text(
        'Filter by date',
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
