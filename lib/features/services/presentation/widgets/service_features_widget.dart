import 'package:flutter/material.dart';
import 'package:serve_home/core/styles/app_style.dart';

class ServiceFeaturesWidget extends StatelessWidget {
  const ServiceFeaturesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Container(
              child: Icon(Icons.shield_outlined, color: Color(0xff5283a8)),
              decoration: BoxDecoration(
                color: Color(0xffeff6ff),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 60,
              width: 58,
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 90,
              child: Text(
                'Verified Porfessionals',
                textAlign: TextAlign.center,
                style: AppStyle.subTitle,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              child: Icon(Icons.timer_sharp, color: Color(0xff5283a8)),
              decoration: BoxDecoration(
                color: Color(0xffeff6ff),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 60,
              width: 58,
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 90,
              child: Text(
                'Flexible Scheduling',
                textAlign: TextAlign.center,
                style: AppStyle.subTitle,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              child: Icon(Icons.star_border_outlined, color:    Color(0xff5283a8),),
              decoration: BoxDecoration(
              color: Color(0xffeff6ff),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 60,
              width: 58,
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 90,
              child: Text(
                'Top Rated Service',
                textAlign: TextAlign.center,
                style: AppStyle.subTitle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
