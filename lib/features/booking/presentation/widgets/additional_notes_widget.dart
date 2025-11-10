import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class AdditionalNotesWidget extends StatelessWidget {
  const AdditionalNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewModel>(
      builder:
          (context, provBokking, child) => Column(
            children: [
              Text('Additional Notes', style: AppStyle.body15),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  provBokking.addNote(value);
             
                },
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Any special instructions or requirements...',
                  hintStyle: AppStyle.hintTextStyle,
                  fillColor: AppColor.filledTextField,
                  filled: true,
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
