import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';

// ignore: must_be_immutable
class CusstomBookWidget extends StatelessWidget {
  CusstomBookWidget({required this.indexScreen, required this.fun, super.key , required this.serviceModel});
  int indexScreen;
  Function()? fun;
  ServiceModel serviceModel ; 

  @override
  Widget build(BuildContext context) {
    final double paddingTop = (ScreenSize.h(context) * 0.04).clamp(20, 40);
    final double paddingSide = (ScreenSize.w(context) * 0.04).clamp(16, 30);
    final double avatarRadius = (ScreenSize.w(context) * 0.035).clamp(15, 25);
    final double dividerWidth = (ScreenSize.w(context) * 0.08).clamp(50, 80);
    final double iconSize = (ScreenSize.w(context) * 0.06).clamp(20, 28);
    final double titleFontSize = (ScreenSize.w(context) * 0.045).clamp(16, 20);
    final double subTitleFontSize = (ScreenSize.w(context) * 0.03).clamp(12, 16);
    final double circleFontSize = (ScreenSize.w(context) * 0.035).clamp(12, 16);

    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: paddingSide / 4, top: paddingTop),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: avatarRadius * 2.5,
                      child: ElevatedButton(
                        onPressed: fun,
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.zero),
                          elevation: WidgetStatePropertyAll(0),
                          iconSize: WidgetStatePropertyAll(iconSize),
                          shape: WidgetStatePropertyAll(CircleBorder()),
                          backgroundColor: WidgetStatePropertyAll(Color(0xfff3f4f6)),
                        ),
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: paddingSide / 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book Service',
                          style: AppStyle.body19(context).copyWith(
                            color: Colors.black,
                            fontSize: titleFontSize,
                          ),
                        ),
                        Text(
                         serviceModel.name ,
                          style: AppStyle.subTitle(context).copyWith(
                            color: AppColor.primary,
                            fontSize: subTitleFontSize,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingSide,
                    vertical: paddingTop / 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: AppColor.primary,
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: circleFontSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: avatarRadius / 2),
                      SizedBox(
                        width: dividerWidth,
                        child: Divider(
                          color: indexScreen == 0
                              ? const Color.fromARGB(57, 163, 160, 160)
                              : AppColor.primary,
                          thickness: 3.5,
                        ),
                      ),
                      SizedBox(width: avatarRadius / 2),
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor:
                            indexScreen == 0 ? const Color.fromARGB(57, 163, 160, 160) : AppColor.primary,
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: circleFontSize,
                            color: indexScreen == 0 ? const Color.fromARGB(255, 141, 140, 140) : Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: avatarRadius / 2),
                      SizedBox(
                        width: dividerWidth,
                        child: Divider(
                          color: indexScreen == 0 || indexScreen == 1
                              ? const Color.fromARGB(57, 163, 160, 160)
                              : AppColor.primary,
                          thickness: 3.5,
                        ),
                      ),
                      SizedBox(width: avatarRadius / 2),
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor:
                            indexScreen == 0 || indexScreen == 1
                                ? const Color.fromARGB(57, 163, 160, 160)
                                : AppColor.primary,
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: circleFontSize,
                            color: indexScreen == 0 || indexScreen == 1
                                ? const Color.fromARGB(255, 141, 140, 140)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: const Color.fromARGB(57, 163, 160, 160),
            thickness: 0.38,
          ),
        ],
      ),
    );
  }
}
