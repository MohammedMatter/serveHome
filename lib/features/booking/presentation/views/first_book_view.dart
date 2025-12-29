import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/widgets/custom_book_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/select_date_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/select_time_widget.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';

class FirstBookView extends StatelessWidget {
   FirstBookView({super.key , required this.service});
final ServiceModel service ; 
  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = (ScreenSize.w(context) * 0.04).clamp(16, 32);
    final double verticalPadding = (ScreenSize.h(context) * 0.02).clamp(10, 20);
    final double containerHeight = (ScreenSize.h(context) * 0.9).clamp(500, double.infinity);
    final double borderRadius = (ScreenSize.w(context) * 0.03).clamp(12, 20);
    final double innerPadding = (ScreenSize.w(context) * 0.05).clamp(20, 40);
    final double spacing = (ScreenSize.h(context) * 0.02).clamp(10, 20);

    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBarDetailsWidget(
          label: 'Continue',
          icon: null,
          navigationToAnotherScreen: () {
            if (provBooking.selectedDate.isEmpty || provBooking.selectedTime.isEmpty) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Booking Incomplete! ⚠️',
                    style: AppStyle.body17.copyWith(fontSize: (ScreenSize.w(context)*0.045).clamp(16, 20)),
                  ),
                  content: Text(
                    'It seems you forgot to choose the date or time 😅. Let\'s finish and set them before we confirm the booking!',
                    style: AppStyle.body15.copyWith(fontWeight: FontWeight.w600, fontSize: (ScreenSize.w(context)*0.035).clamp(14, 18)),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      child: Text('Ok', style: AppStyle.body16.copyWith(fontSize: (ScreenSize.w(context)*0.04).clamp(14, 18))),
                    ),
                  ],
                ),
              );
              return;
            }
            GoRouter.of(context).pushNamed(AppRouter.secondBookView,  extra: service);
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              height: containerHeight,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CusstomBookWidget(
                      serviceModel: service,
                      indexScreen: 0,
                      fun: () {
                        provBooking.reset();
                        GoRouter.of(context).pop();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: innerPadding,
                        vertical: verticalPadding,
                      ),
                      child: Column(
                        children: [
                          SelectDateWidget(),
                          SizedBox(height: spacing),
                          SelectTimeWidget(),
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
    );
  }
}
