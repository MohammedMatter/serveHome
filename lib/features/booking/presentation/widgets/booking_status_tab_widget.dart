import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class BookingStatusTabWidget extends StatelessWidget {
  const BookingStatusTabWidget({super.key, required this.statusBookings});

  final List statusBookings;

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewModel>(
      builder:
          (context, provBooking, child) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 50,
            width: double.infinity,

            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                  statusBookings
                      .map(
                        (status) => Expanded(
                          child: Container(
                          
                            decoration: BoxDecoration(
                              color:
                                  provBooking.selectedBookingTabIndex ==
                                          statusBookings.indexOf(status)
                                      ? AppColor.primary.withOpacity(0.3)
                                      : null,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          
                            alignment: Alignment.center,
                            height: double.infinity,
                            child: InkWell(
                              child: Text(
                                status,
                                style: AppStyle.body17.copyWith(fontSize: 12),
                              ),
                              onTap: () {
                                provBooking.changeBookingTabIndex(
                                  statusBookings.indexOf(status),
                                );
                       
                              },
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
    );
  }
}
