import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';

class ServiceFeaturesWidget extends StatelessWidget {
  const ServiceFeaturesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double iconContainerHeight = (ScreenSize.h(context) * 0.08).clamp(
      50,
      80,
    );
    final double iconContainerWidth = (ScreenSize.w(context) * 0.12).clamp(
      50,
      70,
    );
    final double borderRadius = (ScreenSize.w(context) * 0.03).clamp(12, 20);
    final double spacingHeight = ScreenSize.h(context) * 0.015;
    final double textWidth = (ScreenSize.w(context) * 0.25).clamp(70, 120);
    final double fontSize = (ScreenSize.w(context) * 0.035).clamp(12, 16);

    Widget featureColumn(IconData icon, String label) {
      return Column(
        children: [
          Container(
            height: iconContainerHeight,
            width: iconContainerWidth,
            decoration: BoxDecoration(
              color: Color(0xffeff6ff),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Icon(
              icon,
              color: Color(0xff5283a8),
              size: iconContainerHeight * 0.5,
            ),
          ),
          SizedBox(height: spacingHeight),
          SizedBox(
            width: textWidth,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: AppStyle.subTitle.copyWith(fontSize: fontSize),
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        featureColumn(Icons.shield_outlined, 'Verified Professionals'),
        featureColumn(Icons.timer_sharp, 'Flexible Scheduling'),
        featureColumn(Icons.star_border_outlined, 'Top Rated Service'),
      ],
    );
    
  }
}
