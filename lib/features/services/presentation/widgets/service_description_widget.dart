import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';

class ServiceDescriptionWidget extends StatelessWidget {
  final ServiceModel service;
  ServiceDescriptionWidget({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    // المتغيرات Responsive
    final double horizontalPadding = (ScreenSize.w(context) * 0.02).clamp(12, 24);
    final double verticalSpacing = (ScreenSize.h(context) * 0.015).clamp(8, 20);
    final double textWidth = (ScreenSize.w(context) * 0.9).clamp(250, 600);
    final double titleFontSize = (ScreenSize.w(context) * 0.045).clamp(18, 22);
    final double descriptionFontSize = (ScreenSize.w(context) * 0.035).clamp(14, 18);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About this Service',
            style: AppStyle.body19.copyWith(fontSize: titleFontSize),
          ),
          SizedBox(height: verticalSpacing),
          SizedBox(
            width: textWidth,
            child: Text(
              service.description,
              style: AppStyle.subTitle.copyWith(fontSize: descriptionFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
