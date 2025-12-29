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
import 'package:serve_home/features/booking/presentation/widgets/text_field_service_address_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/dotted_border_widget.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';

class SecondBookView extends StatelessWidget {
   SecondBookView({super.key , required this.serviceModel});
ServiceModel serviceModel ; 
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationViewModel>(
      builder:
          (context, provLocation, child) => Scaffold(
            bottomNavigationBar: BottomNavigationBarDetailsWidget(
              navigationToAnotherScreen: () {
                if (provLocation.address.isEmpty) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          content: Text(
                            'You missed selecting current position for your service.',
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
                  return;
                }
                GoRouter.of(context).pushNamed(AppRouter.thirdBookView,  extra: serviceModel);
              },
              label: 'Continue',
              icon: null,
            ),
            body: SafeArea(
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
                        serviceModel: serviceModel,
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
                                TextFieldServiceAddressWidget(
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
