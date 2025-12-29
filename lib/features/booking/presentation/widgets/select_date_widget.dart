import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double titleFontSize = (ScreenSize.w(context) * 0.04).clamp(14, 18);
    final double containerHeight = (ScreenSize.h(context) * 0.06).clamp(45, 70);
    final double borderRadius = (ScreenSize.w(context) * 0.03).clamp(10, 16);
    final double padding = (ScreenSize.w(context) * 0.03).clamp(12, 16);
    final double textFontSize = (ScreenSize.w(context) * 0.035).clamp(12, 16);

    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Date',
            style: AppStyle.body15.copyWith(
              color: Colors.black,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: padding / 1.5),
          GestureDetector(
            onTap: () async {
              final picker = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2026),
              );

              if (picker != null) {
                provBooking.selectDate(DateFormat('dd/MM/yyyy').format(picker));
                log(provBooking.selectedDate);
              }
            },
            child: Container(
              padding: EdgeInsets.all(padding / 2),
              height: containerHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.filledTextField,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                provBooking.selectedDate.isEmpty
                    ? 'Tap here to select date'
                    : provBooking.selectedDate,
                style: AppStyle.subTitle.copyWith(
                  fontSize: textFontSize,
                  color: provBooking.selectedDate.isEmpty
                      ? Colors.grey
                      : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
