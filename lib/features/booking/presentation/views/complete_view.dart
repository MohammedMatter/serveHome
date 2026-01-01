import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/services/presentation/widgets/mobile_widgets/bottom_navigation_bar_details_widget.dart';

class CompleteView extends StatelessWidget {
  const CompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    final double avatarRadius = (ScreenSize.w(context) * 0.09).clamp(30, 50);
    final double iconSize = (ScreenSize.w(context) * 0.1).clamp(35, 50);
    final double spacingLarge = (ScreenSize.h(context) * 0.05).clamp(30, 50);
    final double spacingSmall = (ScreenSize.h(context) * 0.015).clamp(10, 20);
    final double mainFontSize = (ScreenSize.w(context) * 0.045).clamp(14, 19);
    final double subFontSize = (ScreenSize.w(context) * 0.035).clamp(12, 16);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBarDetailsWidget(
        navigationToAnotherScreen: () {
          GoRouter.of(context).pushReplacementNamed(AppRouter.homeView);
        },
        label: 'Return To Home Page',
        icon: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: avatarRadius,
              backgroundColor: const Color.fromARGB(255, 181, 233, 183),
              child: Icon(
                Icons.check_circle_outline,
                color: const Color.fromARGB(255, 48, 126, 51),
                size: iconSize,
              ),
            ),
            SizedBox(height: spacingLarge),
            Column(
              children: [
                Text(
                  'The booking has been successfully confirmed 🎉',
                  style: AppStyle.body19(context).copyWith(fontSize: mainFontSize),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: spacingSmall),
                Text(
                  'The technician will contact you soon.',
                  style: AppStyle.body19(context).copyWith(fontSize: subFontSize),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
