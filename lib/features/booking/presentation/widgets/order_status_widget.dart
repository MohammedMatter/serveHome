
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) =>  Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 650,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Status', style: AppStyle.body15),
                SizedBox(height: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(
                            255,
                            219,
                            252,
                            231,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Color.fromARGB(255, 58, 201, 112),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: Color(0xff7bf1a8),
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Booking Confirmed',
                          style: AppStyle.body15,
                        ),
                        SizedBox(height: 5),
                        Text(provBooking.selectedTime, style: AppStyle.body15),
                      ],
                    ),
                  ],
                ),
      
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(
                            255,
                            219,
                            252,
                            231,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Color.fromARGB(255, 58, 201, 112),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: Color(0xff7bf1a8),
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Professional Assigned',
                          style: AppStyle.body15,
                        ),
                        SizedBox(height: 5),
                        Text(provBooking.selectedTime, style: AppStyle.body15),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.filledTextField,
                          child: Icon(
                            Icons.circle,
                            size: 13,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: Colors.grey.shade400,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'On the Way',
                          style: AppStyle.body15.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Expected 10:45 Am',
                          style: AppStyle.body15.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.filledTextField,
                          child: Icon(
                            Icons.circle,
                            size: 13,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: Colors.grey.shade400,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Service in Progress',
                          style: AppStyle.body15.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.filledTextField,
                          child: Icon(
                            Icons.circle,
                            size: 13,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: Colors.grey.shade400,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Completed',
                          style: AppStyle.body15.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
