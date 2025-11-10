
import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';

class DisountWidget extends StatelessWidget {
  const DisountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 350,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              AppColor.primary,
              AppColor.primary,
              AppColor.secondry,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get 20% off Today !',
                style: AppStyle.body19.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 25,
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(),
                    ),
                  ),
                  label: Text(
                    'Learn More',
                    style: AppStyle.body19.copyWith(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    color: Colors.white,
                    size: 18,
                    Icons.arrow_forward_rounded,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
