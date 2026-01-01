import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/responsive_config.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';

class ServiceDetailsWebWidget extends StatelessWidget {
  final String name;
  final String category;
  final String price;
  final String description;
  final String time;
  final ResponsiveConfig confegResposive;

  const ServiceDetailsWebWidget({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.time,
    required this.confegResposive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenSize.h(context) * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  name,
                  style: AppStyle.body17(context).copyWith(
                    fontSize: confegResposive.titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: ScreenSize.w(context) * 0.02),
              Flexible(
                child: Text(
                  category,
                  style: AppStyle.body15(context).copyWith(
                    color: AppColor.secondry,
                    fontSize: confegResposive.titleFontSize * 0.9,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenSize.h(context) * 0.005),


          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.subTitle(context).copyWith(
              fontSize: confegResposive.titleFontSize * 0.9,
            ),
          ),
          SizedBox(height: ScreenSize.h(context) * 0.01),


          Row(
            children: [
              Text(
                '$price \$',
                style: AppStyle.body15(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                  fontSize: confegResposive.titleFontSize,
                ),
              ),
              SizedBox(width: ScreenSize.w(context) * 0.03),
              Row(
                children: [
                  Icon(Icons.timer_outlined, size: confegResposive.titleFontSize * 0.9),
                  SizedBox(width: 4),
                  Text(
                    '$time hours',
                    style: AppStyle.body15(context).copyWith(
                      fontSize: confegResposive.titleFontSize * 0.9,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
