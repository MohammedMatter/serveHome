import 'dart:developer';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/location_view_model.dart';

// ignore: must_be_immutable
class DottedBorderWidget extends StatelessWidget {
  DottedBorderWidget({super.key});
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double containerHeight = (ScreenSize.h(context) * 0.065).clamp(45, 55);
    final double radius = (ScreenSize.w(context) * 0.025).clamp(8, 12);
    final double iconSize = (ScreenSize.w(context) * 0.06).clamp(20, 30);
    final double spacing = (ScreenSize.w(context) * 0.015).clamp(5, 10);
    final double fontSize = (ScreenSize.w(context) * 0.038).clamp(14, 16);

    return Consumer<LocationViewModel>(
      builder: (context, provLocation, child) => InkWell(
        onTap: !provLocation.isLoading
            ? () async {
                try {
                  await provLocation.getCurrentLocation();
                  await provLocation.getAddressFromLatLng(
                    provLocation.currentPosition!,
                  );
                  log('place : ${provLocation.address}');
                } catch (e) {
                  print('Error getting location: $e');
                }
              }
            : null,
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            strokeWidth: 0.9,
            dashPattern: [10, 5],
            color: AppColor.primary,
            radius: Radius.circular(radius),
          ),
          child: Container(
            alignment: Alignment.center,
            height: containerHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on_outlined, color: AppColor.primary, size: iconSize),
                SizedBox(width: spacing),
                Text(
                  'Use Current Location',
                  style: AppStyle.subTitle(context).copyWith(
                    fontSize: fontSize,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
