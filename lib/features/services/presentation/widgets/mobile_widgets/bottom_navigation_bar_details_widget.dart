import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';

// ignore: must_be_immutable
class BottomNavigationBarDetailsWidget extends StatelessWidget {
  String label;
  Function() navigationToAnotherScreen;
  Icon? icon;

  BottomNavigationBarDetailsWidget({
    required this.navigationToAnotherScreen,
    required this.label,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: (screenHeight * 0.12).clamp(80, 120),
      width: double.infinity,
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          height: (screenHeight * 0.07).clamp(45, 60),
          width: double.infinity,
          child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColor.primary),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: (screenHeight * 0.015).clamp(8, 15),
                  horizontal: (screenWidth * 0.04).clamp(12, 20),
                ),
              ),
            ),
            onPressed: navigationToAnotherScreen,
            icon: icon ?? SizedBox.shrink(),
            label: Text(
              label,
              style: TextStyle(
                fontSize: (screenWidth * 0.045).clamp(14, 18),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
