
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class BookingsHeaderWidget extends StatelessWidget {
  const BookingsHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) =>  Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ],
          color: Colors.white,
        ),
        height: ScreenSize.h(context) * 0.15,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My Bookings', style: AppStyle.header),
                  SizedBox(
                    width: 210,
                    child: Text(
                      'View and manage your service bookings',
                      maxLines: 2,
                      style: AppStyle.hintTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                width: 130,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.secondry,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${provBooking.selectedBookings.length} Bookings',
                    style: AppStyle.button,
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