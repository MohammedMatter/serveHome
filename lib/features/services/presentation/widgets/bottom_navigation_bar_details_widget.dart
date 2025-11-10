import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';

// ignore: must_be_immutable
class BottomNavigationBarDetailsWidget extends StatelessWidget {
  String label;

  Function() navigationToAnotherScreen;
  Icon? icon ; 
  BottomNavigationBarDetailsWidget({
    required this.navigationToAnotherScreen,
    required this.label,
    required this.icon , 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          width: double.infinity,
          child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColor.primary),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            onPressed: navigationToAnotherScreen,
            label: Text(label),
            icon: icon,
          ),
        ),
      ),
    );
  }
}
