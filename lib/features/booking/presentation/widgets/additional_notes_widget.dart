import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class AdditionalNotesWidget extends StatelessWidget {
  const AdditionalNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double verticalSpacing = (ScreenSize.h(context) * 0.015).clamp(8, 16);
    final double borderRadius = (ScreenSize.w(context) * 0.03).clamp(10, 16);
    final double fontSize = (ScreenSize.w(context) * 0.037).clamp(12, 16);
    final double hintFontSize = (ScreenSize.w(context) * 0.035).clamp(12, 15);

    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Additional Notes',
            style: AppStyle.body15(context).copyWith(fontSize: fontSize),
          ),
          SizedBox(height: verticalSpacing),
          TextField(
            onChanged: (value) {
              provBooking.addNote(value);
            },
            maxLines: 4,
            style: TextStyle(fontSize: fontSize),
            decoration: InputDecoration(
              hintText: 'Any special instructions or requirements...',
              hintStyle: AppStyle.hintTextStyle(context).copyWith(fontSize: hintFontSize),
              fillColor: AppColor.filledTextField,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(style: BorderStyle.none),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(style: BorderStyle.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
