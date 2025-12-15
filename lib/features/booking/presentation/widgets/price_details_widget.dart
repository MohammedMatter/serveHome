import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ServiceViewModel, BookingViewModel>(
      builder:
          (context, provService, provBook, child) => Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  color: Colors.black12,
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            height: 250,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price Details', style: AppStyle.body15),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service Fee', style: AppStyle.body15),
                      Text(
                        '\$${double.parse(provService.selectedService!.price)}',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax', style: AppStyle.body15),
                      Text('\$1.90'),
                    ],
                  ),
                  provBook.isFirstBooking
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'First Time Dicount(20%)',
                            style: AppStyle.body15.copyWith(
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            '\$-${((double.parse(provService.selectedService!.price) + 1.90) * 0.2).toStringAsFixed(2)}',
                            style: AppStyle.body15.copyWith(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      )
                      : SizedBox.shrink(),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Amount', style: AppStyle.body15),
                      Text(
                        provBook.isFirstBooking
                            ? '\$${(double.parse(provService.selectedService!.price) - ((double.parse(provService.selectedService!.price) + 1.90) * 0.2)).toStringAsFixed(2)}'
                            : (double.parse(
                                      provService.selectedService!.price,
                                    ) +
                                    1.90)
                                .toStringAsFixed(2),
                        style: AppStyle.body15.copyWith(
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
