import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key});

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
              GestureDetector(
                onTap: () async {
                  final picker = await showDatePicker(
                    initialDate: DateTime.now(),
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2026),
                  );

                  provBooking.selectDate(
                    DateFormat('dd/MM/yyyy').format(picker!),
                  );
                  log(provBooking.selectedDate);
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.filledTextField,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                      provBooking.selectedDate.isEmpty
                          ? Text('Tap here to select date')
                          : Text(provBooking.selectedDate),
                ),
              ),
            ],
          ),
    );
  }
}
