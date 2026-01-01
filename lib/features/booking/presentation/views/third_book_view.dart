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
import 'package:serve_home/features/services/presentation/widgets/mobile_widgets/bottom_navigation_bar_details_widget.dart';

class ThirdBookView extends StatelessWidget {
  const ThirdBookView({super.key, required this.serviceModel});
  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = (ScreenSize.w(context) * 0.04).clamp(16, 32);
    final double verticalPadding = (ScreenSize.h(context) * 0.02).clamp(10, 20);
    final double innerPadding = (ScreenSize.w(context) * 0.05).clamp(16, 24);
    final double spacing = (ScreenSize.h(context) * 0.02).clamp(10, 20);
    final double borderRadius = (ScreenSize.w(context) * 0.03).clamp(12, 20);

    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBarDetailsWidget(
          label: 'Confirm booking',
          icon: null,
          navigationToAnotherScreen: () {
            if (provBooking.paymentMethodIndex == -1) {
              log('No payment method selected');
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Booking Incomplete! ⚠️',
                    style: AppStyle.body17(context).copyWith(
                      fontSize: (ScreenSize.w(context) * 0.045).clamp(16, 20),
                    ),
                  ),
                  content: Text(
                    'You missed selecting payment method',
                    style: AppStyle.body15(context).copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: (ScreenSize.w(context) * 0.035).clamp(14, 18),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      child: Text(
                        'Ok',
                        style: AppStyle.body16(context).copyWith(
                          fontSize: (ScreenSize.w(context) * 0.04).clamp(14, 18),
                        ),
                      ),
                    ),
                  ],
                ),
              );
              return;
            }
            GoRouter.of(context).pushNamed(AppRouter.trackOrderView);
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                CusstomBookWidget(
                  serviceModel: serviceModel,
                  indexScreen: 2,
                  fun: () {
                    GoRouter.of(context).pop();
                  },
                ),
                SizedBox(height: spacing),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: innerPadding, vertical: verticalPadding),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PaymentMethodsWidget(),
                          SizedBox(height: spacing / 2),
                          PriceDetailsWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
