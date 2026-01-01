import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';

class CancelOrderButtonWidget extends StatelessWidget {
  const CancelOrderButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = (ScreenSize.w(context) * 0.1).clamp(20, 40);
    final double buttonHeight = (ScreenSize.h(context) * 0.06).clamp(45, 60);
    final double borderRadius = (ScreenSize.w(context) * 0.04).clamp(12, 20);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SizedBox(
        width: double.infinity,
        height: buttonHeight,
        child: OutlinedButton(
          onPressed: () {
            GoRouter.of(context).pushReplacementNamed(AppRouter.homeView);
          },
          style: ButtonStyle(
            side: WidgetStatePropertyAll(
              BorderSide(color: Colors.red, width: 1.5),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            foregroundColor: WidgetStatePropertyAll(Colors.red),
            overlayColor: WidgetStatePropertyAll(Colors.red.shade100),
          ),
          child: Text(
            'Cancel Order',
            style: TextStyle(
              fontSize: (ScreenSize.w(context) * 0.04).clamp(14, 18),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
