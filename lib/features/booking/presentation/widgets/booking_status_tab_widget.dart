import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class BookingStatusTabWidget extends StatelessWidget {
  const BookingStatusTabWidget({super.key, required this.statusBookings});

  final List<String> statusBookings;

  @override
  Widget build(BuildContext context) {
    final double containerHeight = (ScreenSize.h(context) * 0.06).clamp(40, 60);
    final double borderRadius = (ScreenSize.w(context) * 0.02).clamp(5, 10);
    final double horizontalPadding = (ScreenSize.w(context) * 0.04).clamp(8, 16);
    final double fontSize = (ScreenSize.w(context) * 0.032).clamp(10, 14);

    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        height: containerHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: statusBookings.length,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          itemBuilder: (context, index) {
            final bool isSelected = provBooking.selectedBookingTabIndex == index;

            return Container(
              margin: EdgeInsets.symmetric(horizontal: horizontalPadding / 2),
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: isSelected ? AppColor.primary.withOpacity(0.3) : null,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  provBooking.changeBookingTabIndex(index);
                },
                child: Text(
                  statusBookings[index],
                  style: AppStyle.body17(context).copyWith(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
