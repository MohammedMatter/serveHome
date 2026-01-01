import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/location_view_model.dart';
import 'package:serve_home/features/booking/presentation/widgets/cancel_order_button_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/order_status_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/service_details_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/track_order_header_widget.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:serve_home/features/notification/data/models/notification_model.dart';
import 'package:serve_home/features/notification/presentation/view_models/notification_view_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/features/services/presentation/widgets/mobile_widgets/bottom_navigation_bar_details_widget.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class TrackOrderView extends StatefulWidget {
  const TrackOrderView({super.key});

  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends State<TrackOrderView> {
  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = (ScreenSize.w(context) * 0.04).clamp(16, 32);
    final double verticalPadding = (ScreenSize.h(context) * 0.02).clamp(10, 20);
    final double bottomNavHeight = (ScreenSize.h(context) * 0.22).clamp(150, 250);
    final double mapContainerHeight = (ScreenSize.h(context) * 0.25).clamp(150, 300);
    final double spacing = (ScreenSize.h(context) * 0.02).clamp(10, 20);
    final double borderRadius = (ScreenSize.w(context) * 0.03).clamp(12, 20);

    return Consumer6<
      LocationViewModel,
      BookingViewModel,
      ServiceViewModel,
      AuthViewModel,
      NotificationViewModel,
      HomeViewModel
    >(
      builder: (
        context,
        provLocation,
        provBooking,
        provService,
        provAuth,
        provNotification,
        provHome,
        child,
      ) => Scaffold(
        bottomNavigationBar: SizedBox(
          height: bottomNavHeight,
          child: Column(
            children: [
              BottomNavigationBarDetailsWidget(
                label: 'Complete',
                icon: null,
                navigationToAnotherScreen: () async {
                  final bookModel = BookModel(
                    serviceDescription: provService.selectedService!.description,
                    serviceCategory: provService.selectedService!.category,
                    date: provBooking.selectedDate,
                    time: provBooking.selectedTime,
                    serviceAddress: provLocation.address,
                    paymentMethod: provBooking.selectedPaymentMethod,
                    serviceName: provService.selectedService!.name,
                    userId: provAuth.user!.id!,
                    status: 'Pending',
                    note: provBooking.note,
                    imageUrl: provService.selectedService!.detailImageUrl,
                    price: provBooking.isFirstBooking
                        ? (double.parse(provService.selectedService!.price) -
                                ((double.parse(provService.selectedService!.price) + 1.90) * 0.2))
                            .toStringAsFixed(2)
                        : (double.parse(provService.selectedService!.price) + 1.90).toString(),
                    provider: provAuth.user!.name,
                    email: provAuth.user!.email,
                  );

                  final book = await provBooking.createBooking(bookModel: bookModel);

                  NotificationModel notification = NotificationModel(
                    createAt: DateTime.now(),
                    status: 'Pending',
                    bookingId: book.id!,
                    title: "Your reservation has been received",
                    body: "Your request for ${provService.selectedService!.name} awaiting confirmation",
                    read: false,
                    userId: provAuth.user!.id!,
                    type: "booking",
                  );

                  await provNotification.addNotification(
                    idUser: provAuth.user!.id!,
                    notification: notification,
                  );
                  await provNotification.showNotification(notification: notification);

                  provHome.reset();
                  provBooking.reset();

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    GoRouter.of(context).pushNamed(AppRouter.completeView);
                  });
                },
              ),
              CancelOrderButtonWidget(),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Column(
                children: [
                  TrackOrderHeaderWidget(),
                  SizedBox(height: spacing),
                  Container(
                    height: mapContainerHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffd5e7fe),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_outlined, size: ScreenSize.w(context) * 0.12, color: AppColor.primary),
                          SizedBox(height: spacing / 2),
                          Text('Professional is on the way',
                              style: AppStyle.body15(context).copyWith(fontSize: (ScreenSize.w(context) * 0.04).clamp(14, 18))),
                          SizedBox(height: spacing / 4),
                          Text('ETA: 15 minutes',
                              style: AppStyle.body15(context).copyWith(fontSize: (ScreenSize.w(context) * 0.04).clamp(14, 18))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: spacing),
                  OrderStatusWidget(),
                  SizedBox(height: spacing),
                  ServiceDetailsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
