import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class WelcomeSignInWidget extends StatelessWidget {
  const WelcomeSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.h(context) * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ScreenSize.h(context) * 0.01),
          bottom: Radius.circular(ScreenSize.h(context) * 0.05),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Back', style: AppStyle.button(context)),
            SizedBox(height: ScreenSize.h(context) * 0.01),
            Text(
              'Sign in to continue',
              style: AppStyle.button(context).copyWith(color: Color(0xffb7eaf7)),
            ),
          ],
        ),
      ),
    );
  }
}
