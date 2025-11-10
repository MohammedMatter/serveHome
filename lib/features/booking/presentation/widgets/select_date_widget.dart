import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key, required this.dateFormatter});

  final MaskTextInputFormatter dateFormatter;

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewModel>(
      builder:
          (context, provBooking, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Date',
                style: AppStyle.body15.copyWith(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  provBooking.selectDate(value);
                  log(provBooking.selectedDate) ; 
                },
                inputFormatters: [dateFormatter],
                decoration: InputDecoration(
                  hintText: 'mm/dd/yy',
                  filled: true,
                  fillColor: AppColor.filledTextField,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
