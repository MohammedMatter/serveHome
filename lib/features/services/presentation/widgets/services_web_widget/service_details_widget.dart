

import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/responsive_config.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';

class ServiceDetailsWebWidget extends StatelessWidget {
   ServiceDetailsWebWidget({
    required this.category , 
    super.key, required this.confegResposive , required this.name , required this.description , required this.price , required this.time});
String name ; 
String category ; 
String price ; 
String description ; 
String time ; 
  final ResponsiveConfig confegResposive;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenSize.w(context) * 0.006),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name , 
                
                  style: AppStyle.body17.copyWith(
                    fontSize: confegResposive.titleFontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                    SizedBox(width: 5,) , 
                     Text(
                  category , 
                
                  style: AppStyle.body15.copyWith(
                    color:AppColor.secondry,
                    fontSize: confegResposive.titleFontSize,
                  ),
                ),
            
           
              ],
            ),
            Text(
              description  , 
              overflow: TextOverflow.ellipsis,
              
              maxLines: 2,
              style: AppStyle.subTitle.copyWith(
                fontSize: confegResposive.titleFontSize,
              ),
            ),
          ],
        ),
        SizedBox(height: ScreenSize.w(context) * 0.005),
        Row(
          children: [
            Text(
              '$price \$',
              style: AppStyle.body15.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.green,
                fontSize: confegResposive.titleFontSize,
              ),
            ),
            SizedBox(width: ScreenSize.w(context) * 0.02),
            Row(
              children: [
                Icon(Icons.timer_outlined, size: 15),
                Text(
                  '$time hours',

                  style: AppStyle.body15.copyWith(
                    fontSize: confegResposive.titleFontSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
