import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive values
    final double horizontalPadding = (ScreenSize.w(context) * 0.05).clamp(15, 25);
    final double verticalPadding = (ScreenSize.h(context) * 0.03).clamp(20, 30);
    final double spacing = (ScreenSize.h(context) * 0.03).clamp(20, 30);
    final double fontSize = (ScreenSize.w(context) * 0.035).clamp(13, 16);
    return Consumer2<ServiceViewModel, BookingViewModel>(
      builder: (context, provService, provBook, child) => Card(
        elevation: 10, // شادو زي ما بدك
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
   
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price Details',
                  style: AppStyle.body15(context).copyWith(fontSize: fontSize),
                ),
                SizedBox(height: spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Service Fee',
                      style: AppStyle.body15(context).copyWith(fontSize: fontSize),
                    ),
                    Text(
                      '\$${double.parse(provService.selectedService!.price)}',
                      style: AppStyle.body15(context).copyWith(fontSize: fontSize),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax',
                      style: AppStyle.body15(context).copyWith(fontSize: fontSize),
                    ),
                    Text(
                      '\$1.90',
                      style: AppStyle.body15(context).copyWith(fontSize: fontSize),
                    ),
                  ],
                ),
                provBook.isFirstBooking
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'First Time Discount(20%)',
                            style: AppStyle.body15(context)
                                .copyWith(color: Colors.green, fontSize: fontSize),
                          ),
                          Text(
                            '\$-${((double.parse(provService.selectedService!.price) + 1.90) * 0.2).toStringAsFixed(2)}',
                            style: AppStyle.body15(context)
                                .copyWith(color: Colors.green, fontSize: fontSize),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: AppStyle.body15(context).copyWith(fontSize: fontSize),
                    ),
                    Text(
                      provBook.isFirstBooking
                          ? '\$${(double.parse(provService.selectedService!.price) - ((double.parse(provService.selectedService!.price) + 1.90) * 0.2)).toStringAsFixed(2)}'
                          : (double.parse(provService.selectedService!.price) + 1.90).toStringAsFixed(2),
                      style: AppStyle.body15(context)
                          .copyWith(color: AppColor.primary, fontSize: fontSize),
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
