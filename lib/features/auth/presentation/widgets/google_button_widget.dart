
import 'package:flutter/material.dart';
import 'package:serve_home/core/styles/app_style.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: Colors.grey, width: 1.2),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            child: Image.asset(
              'assets/images/icons/google_icon.png',
            ),
          ),
          SizedBox(width: 10),
          
          Text('Google', style: AppStyle.body15),
        ],
      ),
    );
  }
}
