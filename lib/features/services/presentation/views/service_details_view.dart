import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/customer_review_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/service_description_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/service_features_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/service_header_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/service_inclusion_widget.dart';

class ServiceDetailsView extends StatelessWidget {
  ServiceModel service ; 
  ServiceDetailsView({super.key , required this.service});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarDetailsWidget(
        label: 'Book Now',
        navigationToAnotherScreen: () {
          GoRouter.of(context).pushNamed(AppRouter.fitstBookView);
        },
        icon: Icon(Icons.event),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          ServiceHeaderWidget(service: service,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                SizedBox(height: 25),
                                ServiceFeaturesWidget(),
                                SizedBox(height: 25),
                                ServiceDescriptionWidget(service: service,),
                                SizedBox(height: 15),
                                ServiceInclusionsWidget(),
                              ],
                            ),
                          ),

                          CustomerReviewsWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
