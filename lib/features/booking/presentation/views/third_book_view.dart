import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/widgets/custom_book_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/payment_methods_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/price_details_widget.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';

// ignore: must_be_immutable
class ThirdBookView extends StatelessWidget {
  ThirdBookView({super.key, required this.serviceModel});
  ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewModel>(
      builder:
          (context, provBooking, child) => Scaffold(
            bottomNavigationBar: BottomNavigationBarDetailsWidget(
              navigationToAnotherScreen: () {
                if (provBooking.paymentMethodIndex == -1) {
                  log('kkkkkkkkkkkkk');
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          content: Text(
                            'You missed selecting payment method',
                            style: AppStyle.body15.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          title: Text(
                            'Booking Incomplete! ⚠️',
                            style: AppStyle.body17,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                GoRouter.of(context).pop();
                              },
                              child: Text('Ok', style: AppStyle.body16),
                            ),
                          ],
                        ),
                  );
                }
                provBooking.paymentMethodIndex != -1
                    ? GoRouter.of(context).pushNamed(AppRouter.trackOrderView)
                    : null;
              },
              label: 'Confirm bokking',
              icon: null,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: ScreenSize.h(context) * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CusstomBookWidget(
                            serviceModel: serviceModel,
                            indexScreen: 2,
                            fun: () {
                              GoRouter.of(context).pop();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PaymentMethodsWidget(),
                                SizedBox(height: 8),
                                PriceDetailsWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
