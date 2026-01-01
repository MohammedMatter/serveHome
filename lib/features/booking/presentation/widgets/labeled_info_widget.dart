import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

// ignore: must_be_immutable
class LabeledInfoWidget extends StatelessWidget {
  String label;
  String info;
  IconData icon;
  Color? infoColor;

  LabeledInfoWidget({
    this.infoColor,
    required this.label,
    required this.info,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = (ScreenSize.w(context) * 0.045).clamp(16, 22);
    final double spacing = (ScreenSize.w(context) * 0.012).clamp(4, 8);
    final double verticalSpacing = (ScreenSize.h(context) * 0.008).clamp(3, 6);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColor.primary, size: iconSize),
            SizedBox(width: spacing),
            Text(
              label,
              style: AppStyle.body13(context).copyWith(
                fontSize: (ScreenSize.w(context) * 0.035).clamp(12, 16),
              ),
            ),
          ],
        ),
        SizedBox(height: verticalSpacing),
        Text(
          info,
          style: AppStyle.body12(context).copyWith(
            fontSize: (ScreenSize.w(context) * 0.033).clamp(11, 15),
            color: infoColor,
          ),
        ),
      ],
    );
  }
}
