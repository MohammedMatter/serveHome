import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/features/services/presentation/widgets/mobile_widgets/bottom_navigation_bar_details_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/mobile_widgets/service_description_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/mobile_widgets/service_features_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/mobile_widgets/service_header_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/mobile_widgets/service_inclusion_widget.dart';

class ServiceDetailsView extends StatelessWidget {
  final ServiceModel service;
  ServiceDetailsView({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final double cardRadius = (ScreenSize.w(context) * 0.02).clamp(12, 25);
    final double horizontalPadding = (ScreenSize.w(context) * 0.04).clamp(
      12,
      32,
    );
    final double verticalSpacingSmall = ScreenSize.h(context) * 0.015;
    final double verticalSpacingMedium = ScreenSize.h(context) * 0.02;

    return Consumer<ServiceViewModel>(
      builder:
          (context, provService, child) => Scaffold(
            bottomNavigationBar: BottomNavigationBarDetailsWidget(
              label: 'Book Now',
              navigationToAnotherScreen: () {
                provService.reset();
                GoRouter.of(context).pushNamed(AppRouter.firstBookView , extra: provService.selectedService);
              },
              icon: Icon(Icons.event),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(horizontalPadding),
                  child: Center(
                    child: Container(
                      width:
                          ScreenSize.w(context) > 600 ? 600 : double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(cardRadius),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ServiceHeaderWidget(service: service),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: verticalSpacingMedium),
                                ServiceFeaturesWidget(),//Done Responsive
                                SizedBox(height: verticalSpacingMedium),
                                ServiceDescriptionWidget(service: service),//Done Responsive
                                SizedBox(height: verticalSpacingSmall),
                                ServiceInclusionsWidget(),//Done Responsive
                              ],
                            ),
                          ),
                          SizedBox(height: verticalSpacingMedium),
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
