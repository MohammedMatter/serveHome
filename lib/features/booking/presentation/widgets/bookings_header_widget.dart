import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class BookingsHeaderWidget extends StatelessWidget {
  const BookingsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = (ScreenSize.w(context) * 0.05).clamp(16, 24);
    final double verticalPadding = (ScreenSize.h(context) * 0.02).clamp(12, 20);
    final double containerHeight = (ScreenSize.h(context) * 0.15).clamp(100, 180);
    final double borderRadius = (ScreenSize.w(context) * 0.05).clamp(12, 20);
    final double textWidth = (ScreenSize.w(context) * 0.45).clamp(150, 250);
    final double badgeWidth = (ScreenSize.w(context) * 0.25).clamp(100, 150);
    final double badgeHeight = (ScreenSize.h(context) * 0.07).clamp(40, 70);

    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) => Container(
        margin: EdgeInsets.only(top: verticalPadding),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          color: Colors.white,
        ),
        height: containerHeight,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Bookings',
                    style: AppStyle.header(context).copyWith(
                      fontSize: (ScreenSize.w(context) * 0.06).clamp(18, 25),
                    ),
                  ),
                  SizedBox(
                    width: textWidth,
                    child: Text(
                      'View and manage your service bookings',
                      maxLines: 2,
                      style: AppStyle.hintTextStyle(context).copyWith(
                        fontSize: (ScreenSize.w(context) * 0.04).clamp(12, 16),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: badgeWidth,
                height: badgeHeight,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.secondry,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: Text(
                    '${provBooking.selectedBookings.length} Bookings',
                    style: AppStyle.button(context).copyWith(
                      fontSize: (ScreenSize.w(context) * 0.033).clamp(12, 16),
                    ),
                    textAlign: TextAlign.center,
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
