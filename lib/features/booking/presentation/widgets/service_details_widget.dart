
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/location_view_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class ServiceDetailsWidget extends StatelessWidget {
  const ServiceDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer3<BookingViewModel , ServiceViewModel , LocationViewModel>(
    builder: (context, provBooking,provService ,provLocation,   child) =>  Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Container(
          height: 250,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Service details', style: AppStyle.body19),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(  'Service',style: AppStyle.body16),
                    Text(provService.selectedService!.name , style: AppStyle.body15),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date&Time', style: AppStyle.body16),
                    Text(
                      '${provBooking.selectedDate} at ${provBooking.selectedTime}',
                      style: AppStyle.body15,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Address', style: AppStyle.body16),
                    Text(provLocation.address, style: AppStyle.body15),
                  ],
                ),
                SizedBox(height: 10),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment Method ', style: AppStyle.body16),
                    Text(
                      provBooking.selectedPaymentMethod,
                      style: AppStyle.body15,
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
