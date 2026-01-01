import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/data_table_widget.dart';

class AllBookingsTableWidget extends StatelessWidget {
  const AllBookingsTableWidget({
    super.key,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeViewModel, BookingViewModel>(
      builder:
          (context, provHome, provBooking, child) => SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 252, 251, 248),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),

              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateTableWidget(
                    verticalPadding: verticalPadding,
                    horizontalPadding: horizontalPadding,
                  ),
                  provBooking.allUsersBookings.isEmpty
                      ? Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: verticalPadding * 2,
                        ),
                        child: Center(child: Text('No Bookings')),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
    );
  }
}
