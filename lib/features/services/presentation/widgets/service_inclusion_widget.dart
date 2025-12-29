import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';

class ServiceInclusionsWidget extends StatelessWidget {
  const ServiceInclusionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // متغيرات Responsive
    final double titleFontSize = (ScreenSize.w(context) * 0.045).clamp(18, 22);
    final double iconSize = (ScreenSize.w(context) * 0.035).clamp(16, 20);
    final double spacingWidth = (ScreenSize.w(context) * 0.04).clamp(10, 20);
    final double spacingHeight = (ScreenSize.h(context) * 0.01).clamp(5, 12);
    final double textFontSize = (ScreenSize.w(context) * 0.035).clamp(14, 18);
    final double horizontalPadding = (ScreenSize.w(context) * 0.02).clamp(12, 24);

    Widget inclusionRow(String text) {
      return Padding(
        padding: EdgeInsets.only(bottom: spacingHeight),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.circle, color: Colors.green, size: iconSize),
            SizedBox(width: spacingWidth),
            Expanded(
              child: Text(
                text,
                style: AppStyle.subTitle.copyWith(fontSize: textFontSize),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What\'s included',
            style: AppStyle.body19.copyWith(fontSize: titleFontSize),
          ),
          SizedBox(height: spacingHeight),
          inclusionRow('Professional equipment and supplies'),
          inclusionRow('Background-checked professionals'),
          inclusionRow('100% satisfaction guarantee'),
          inclusionRow('Free rescheduling if needed'),
        ],
      ),
    );
  }
}
