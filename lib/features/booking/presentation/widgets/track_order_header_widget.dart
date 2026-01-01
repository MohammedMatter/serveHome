import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';

class TrackOrderHeaderWidget extends StatelessWidget {
  const TrackOrderHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final double topPadding = (ScreenSize.h(context) * 0.04).clamp(20, 40);
    final double leftPadding = (ScreenSize.w(context) * 0.02).clamp(5, 10);
    final double buttonHeight = (ScreenSize.h(context) * 0.06).clamp(35, 50);
    final double iconSize = (ScreenSize.w(context) * 0.06).clamp(20, 28);
    final double titleFontSize = (ScreenSize.w(context) * 0.045).clamp(16, 20);
    final double subtitleFontSize = (ScreenSize.w(context) * 0.033).clamp(12, 14);

    return Padding(
      padding: EdgeInsets.only(top: topPadding, left: leftPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: buttonHeight,
            child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                elevation: const WidgetStatePropertyAll(0),
                iconSize: WidgetStatePropertyAll(iconSize),
                shape: const WidgetStatePropertyAll(CircleBorder()),
                backgroundColor: const WidgetStatePropertyAll(Color(0xfff3f4f6)),
              ),
              child: Icon(Icons.arrow_back, color: Colors.black, size: iconSize),
            ),
          ),
          SizedBox(width: leftPadding), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Track Order',
                style: AppStyle.body19(context).copyWith(
                  color: Colors.black,
                  fontSize: titleFontSize,
                ),
              ),
              SizedBox(height: topPadding * 0.1),
              Text(
                'Order #SH-59262',
                style: AppStyle.subTitle(context).copyWith(
                  color: AppColor.primary,
                  fontSize: subtitleFontSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
