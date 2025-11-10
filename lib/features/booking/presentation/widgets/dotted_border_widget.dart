import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/location_view_model.dart';

class DottedBorderWidget extends StatelessWidget {
  DottedBorderWidget({super.key});
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationViewModel>(
      builder:
          (context, provLocation, child) => InkWell(
            onTap:!provLocation.isLoading? () async {
              try {
                await provLocation.getCurrentLocation();
                await provLocation.getAddressFromLatLng(
                  provLocation.currentPosition!,
                );
                log('place : ${provLocation.address}');
              } catch (e) {
                print('Error getting location: $e');
              }
            }:null ,
            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                strokeWidth: 0.9,
                dashPattern: [10, 5],
                color: AppColor.primary,
                radius: Radius.circular(10),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined, color: AppColor.primary),
                    SizedBox(width: 5),
                    Text(
                      'Use Current Location',
                      style: AppStyle.subTitle.copyWith(
                        fontSize: 15,
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
