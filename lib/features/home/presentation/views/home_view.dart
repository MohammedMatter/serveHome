import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:serve_home/features/home/presentation/widgets/book_service.dart';
import 'package:serve_home/features/home/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/discount_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/featured_providers_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/search_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/service_categories_widget.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    final provService = Provider.of<ServiceViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAllBookings();

    });
    provService.getServices();
  }

  Future fetchAllBookings() async {
    final provBookings = Provider.of<BookingViewModel>(context, listen: false);
    final provAuth = Provider.of<AuthViewModel>(context, listen: false);
    await provBookings.fetchAllBookings(idUser: provAuth.user!.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.only(right: 15),
        backgroundColor: AppColor.primary,
        title: Text('ServeHome', style: AppStyle.appBarTitle),
        actions: [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BookServiceWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchWidget(),
                    SizedBox(height: 15),
                    Text('Services Ctegories', style: AppStyle.body19),
                    SizedBox(height: 10),
                    ServiceCtegoriesWidget(),
                    SizedBox(height: 15),
                    Text('Featured Providers', style: AppStyle.body19),
                    SizedBox(height: 10),
                    FeaturesProvidersWidget(),
                    SizedBox(height: 10),
                    DisountWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
