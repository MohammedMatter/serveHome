import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';

class BookServiceWidget extends StatelessWidget {
  const BookServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: ScreenSize.h(context) * 0.10,
          width: double.infinity,
          color: Color(0xff1f5d8c),
        ),
        Align(
          child: Container(
            alignment: Alignment.center,
            height: 140,
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
                colors: [AppColor.primary, AppColor.secondry],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book a Service',
                  style: AppStyle.appBarTitle.copyWith(fontSize: 28),
                ),
                SizedBox(height: 5),
                ElevatedButton.icon(
                  onPressed: () {},
                  iconAlignment: IconAlignment.end,
                  icon: Icon(Icons.arrow_forward_rounded , color: Colors.white,),
                  label: Text('Book a Service', style: AppStyle.button),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    backgroundColor: WidgetStatePropertyAll(AppColor.secondry),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
