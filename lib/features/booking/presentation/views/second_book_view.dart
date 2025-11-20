import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/location_view_model.dart';
import 'package:serve_home/features/booking/presentation/widgets/additional_notes_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/custom_book_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/text_field_service_address.dart';
import 'package:serve_home/features/booking/presentation/widgets/dotted_border_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';

class SecondBookView extends StatelessWidget {
  const SecondBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarDetailsWidget(
        navigationToAnotherScreen: () {
          GoRouter.of(context).pushNamed(AppRouter.thirdBookView);
        },
        label: 'Continue',
        icon: null,
      ),
      body: Consumer<LocationViewModel>(
        builder:
            (context, provLocation, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: ScreenSize.h(context) * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CusstomBookWidget(
                        indexScreen: 1,
                        fun: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Service Address', style: AppStyle.body15),
                                SizedBox(height: 10),
                                TextFieldServiceAddress(
                                  hint: 'Enter Your Adress',
                                ),
                                SizedBox(height: 25),
                                DottedBorderWidget(),
                                SizedBox(height: 20),
                                AdditionalNotesWidget(),
                              ],
                            ),
                            provLocation.isLoading
                                ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColor.primary,
                                  ),
                                )
                                : SizedBox.shrink(),
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
