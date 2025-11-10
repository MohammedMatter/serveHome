import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class PaymentMethodsWidget extends StatelessWidget {
  PaymentMethodsWidget({super.key});
  Map<String, Icon> paymentMethods = {
    'Credit/Debit Card': Icon(
      Icons.credit_card,
      color: const Color.fromARGB(255, 104, 103, 103),
    ),
    'Cash': Icon(
      Icons.attach_money_outlined,
      color: const Color.fromARGB(255, 104, 103, 103),
    ),
    'Apple Pay': Icon(
      Icons.apple,
      color: const Color.fromARGB(255, 104, 103, 103),
    ),
  };
  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewModel>(
      builder:
          (context, provBooking, child) => Column(
            children: [
              Text('Payment Method', style: AppStyle.body15),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: List.generate(
                    paymentMethods.length,
                    (index) => InkWell(
                      onTap: () {
                        provBooking.changePaymentMethodIndex(index);
                        if (provBooking.paymentMethodIndex == index) {
                          provBooking.selectPaymentMethod(
                            paymentMethods.keys.elementAt(index),
                          );
                          log('--- : ${paymentMethods.keys.elementAt(index)}');
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              index == provBooking.paymentMethodIndex
                                  ? Border.all(
                                    color: AppColor.primary,
                                    width: 1,
                                  )
                                  : null,
                          color: Color.fromARGB(179, 239, 246, 255),
                        ),
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              paymentMethods.values.elementAt(index),
                              SizedBox(width: 10),
                              Text(
                                paymentMethods.keys.elementAt(index),
                                style: AppStyle.body15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
