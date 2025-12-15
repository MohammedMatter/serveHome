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
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer6<
      LocationViewModel,
      BookingViewModel,
      ServiceViewModel,
      AuthViewModel,
      NotificationViewModel,
      HomeViewModel
    >(
      builder:
          (
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
              height: 180,
              child: Column(
                children: [
                  BottomNavigationBarDetailsWidget(
                    navigationToAnotherScreen: () async {
                      final bookModel = BookModel(
                        serviceDescription:
                            provService.selectedService!.description,
                        serviceCategory: provService.selectedService!.category,
                        date: provBooking.selectedDate,
                        time: provBooking.selectedTime,
                        serviceAddress: provLocation.address,
                        paymentMethod: provBooking.selectedPaymentMethod,
                        serviceName: provService.selectedService!.name,
                        userId: 'zW5KVTaKz4P1CPDtKr3vSdrrcjv1',
                        status: 'Pending',
                        note: provBooking.note,
                        imageUrl: provService.selectedService!.detailImageUrl,
                        price:
                            provBooking.isFirstBooking
                                ? (double.parse(
                                          provService.selectedService!.price,
                                        ) -
                                        ((double.parse(
                                                  provService
                                                      .selectedService!
                                               .price,
                                                ) +
                                                1.90) *
                                            0.2)).toStringAsFixed(2)
                                    .toString()
                                : (double.parse(provService.selectedService!.price)+ 1.90).toString(),
                        provider: provAuth.user!.name,
                        email: provAuth.user!.email,
                      );
                      final book = await provBooking.createBooking(
                        bookModel: bookModel,
                      );
                      NotificationModel notification = NotificationModel(
                        createAt: DateTime.now(),
                        status: 'Pending',
                        bookingId: book.id!,
                        title: "Your reservation has been received",
                        body:
                            "Your request for ${provService.selectedService!.name} awaiting confirmation",                 
                        read: false,
                        userId: provAuth.user!.id!,
                        type: "booking",
                      );
                      await provNotification.addNotification(
                        idUser: provAuth.user!.id!,
                        notification: notification,
                      );
                      await provNotification.showNotification(
                        notification: notification,
                      );
                      provHome.reset();
                      provBooking.reset();
                      GoRouter.of(context).pushNamed(AppRouter.completeView);
                    },
                    label: 'Complete',
                    icon: null,
                  ),
                  CancelOrderButtonWidget(),
                ],
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      TrackOrderHeaderWidget(),

                      SizedBox(height: 20),
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Color(0xffd5e7fe),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 50,
                                color: AppColor.primary,
                              ),
                              Text(
                                'Professional is on the way',
                                style: AppStyle.body15,
                              ),
                              SizedBox(height: 8),
                              Text('ETA: 15 minutes', style: AppStyle.body15),
                            ],
                          ),
                        ),
                      ),
                      OrderStatusWidget(),

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
