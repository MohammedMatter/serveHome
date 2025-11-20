
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
import 'package:serve_home/features/booking/presentation/widgets/track_order_header.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer4<
      LocationViewModel,
      BookingViewModel,
      ServiceViewModel,
      AuthViewModel
    >(
      builder:
          (
            context,
            provLocation,
            provBooking,
            provService,
            provAuth,
            child,
          ) => Scaffold(
            bottomNavigationBar: SizedBox(
              height: 180,
              child: Column(
                children: [
                  BottomNavigationBarDetailsWidget(
                    navigationToAnotherScreen: () async {
                      final bookModel = BookModel(
                        date: provBooking.selectedDate,
                        time: provBooking.selectedTime,
                        serviceAddress: provLocation.address,
                        paymentMethod: provBooking.selectedPaymentMethod,
                        serviceName: provService.selectedService!.name,
                        userId:provAuth.user!.id!,
                        status: 'Pending',
                        note: provBooking.note,
                        imageUrl: provService.selectedService!.detailImageUrl,
                        price: provService.selectedService!.price , 
                        provider: provAuth.user!.name ,
                        email: provAuth.user!.email
                      
                      );
                      await provBooking.createBooking(bookModel: bookModel);
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
                      TrackOrderHeader(),

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
