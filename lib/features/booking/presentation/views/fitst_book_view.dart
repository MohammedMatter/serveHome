import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/widgets/custom_book_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/select_date_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/select_time_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';

class FitstBookView extends StatelessWidget {
  const FitstBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarDetailsWidget(
        label: 'Continue',
        icon: null,
        navigationToAnotherScreen: () {
          GoRouter.of(context).pushNamed(AppRouter.secondBookView);
        },
      ),
      body: BookStep1Widget(),
    );
  }
}

class BookStep1Widget extends StatelessWidget {
  const BookStep1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewModel>(
      builder:
          (context, provBooking, child) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),

              child: Container(
                height: ScreenSize.h(context) * 0.9,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CusstomBookWidget(
                        indexScreen: 0,
                        fun: () {
                          provBooking.reset();
                            GoRouter.of(context).pop();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        child: Column(
                          children: [
                            SelectDateWidget(),
                            SizedBox(height: 15),
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
    );
  }
}
