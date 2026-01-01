import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/location_view_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class ServiceDetailsWidget extends StatelessWidget {
  const ServiceDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = (ScreenSize.w(context) * 0.05).clamp(15, 25);
    final double verticalPadding = (ScreenSize.h(context) * 0.03).clamp(20, 30);
    final double spacing = (ScreenSize.h(context) * 0.02).clamp(10, 25);
    final double titleFontSize = (ScreenSize.w(context) * 0.045).clamp(16, 20);
    final double labelFontSize = (ScreenSize.w(context) * 0.038).clamp(14, 18);
    final double infoFontSize = (ScreenSize.w(context) * 0.035).clamp(13, 16);

    return Consumer3<BookingViewModel, ServiceViewModel, LocationViewModel>(
      builder: (context, provBooking, provService, provLocation, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Service details', style: AppStyle.body17(context).copyWith(fontSize: titleFontSize)),
  
                Divider() , 
                 SizedBox(height: spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Service', style: AppStyle.body16(context).copyWith(fontSize: labelFontSize)),
                    Text(
                      provService.selectedService!.name,
                      style: AppStyle.body15(context).copyWith(fontSize: infoFontSize),
                    ),
                  ],
                ),
                SizedBox(height: spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Date & Time', style: AppStyle.body16(context).copyWith(fontSize: labelFontSize)),
                    ),
                    Text(
                      '${provBooking.selectedDate} at ${provBooking.selectedTime}',
                      style: AppStyle.body15(context).copyWith(fontSize: infoFontSize),
                    ),
                  ],
                ),
                SizedBox(height: spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Address', style: AppStyle.body16(context).copyWith(fontSize: labelFontSize)),
                    ),
                    Expanded(
                      child: Text(
                        provLocation.address,
                        style: AppStyle.body15(context).copyWith(fontSize: infoFontSize),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment Method', style: AppStyle.body16(context).copyWith(fontSize: labelFontSize)),
                    Text(
                      provBooking.selectedPaymentMethod,
                      style: AppStyle.body15(context).copyWith(fontSize: infoFontSize),
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
