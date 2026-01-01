import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double radius = (ScreenSize.w(context) * 0.02).clamp(12, 20);
    return Container(
      height: (ScreenSize.h(context) * 0.13).clamp(120, double.infinity),
      width: ScreenSize.w(context) > 600 ? 600 : double.infinity , 
    
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          colors: [AppColor.primary, AppColor.primary, AppColor.secondry],
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.all(radius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get 20% off Today !',
              style: AppStyle.body19(context).copyWith(
                fontSize: (ScreenSize.h(context)*0.02).clamp(18, double.infinity),
                color: Colors.white,
              ),
            ),
            SizedBox(height: ScreenSize.h(context)*0.01),
            SizedBox(
              height: (ScreenSize.h(context)*0.04).clamp(30, double.infinity),
              child: OutlinedButton.icon(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                ),
                label: Text(
                  'Learn More',
                  style: AppStyle.body19(context).copyWith(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                 fontSize: (ScreenSize.h(context)*0.018).clamp(14, 18) , 
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  color: Colors.white,
                  size: ScreenSize.h(context)*0.03,
                  Icons.arrow_forward_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
