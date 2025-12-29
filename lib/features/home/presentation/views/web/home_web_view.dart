import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:serve_home/features/home/presentation/views/web/dashboard_web_view.dart';

import 'package:serve_home/features/home/presentation/widgets/web_widgets/drawer_widget.dart';

// ignore: must_be_immutable
class HomeWebView extends StatelessWidget {
  const HomeWebView({super.key});

  @override
  Widget build(BuildContext context) {
        log('web : ${kIsWeb}') ; 
    return Scaffold(
      body: Consumer3<HomeViewModel, BookingViewModel, AuthViewModel>(
        builder:
            (context, provHome, provBooking, provAuth, child) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerWidget(),
                provHome.drowerIndex == 0
                    ? DashboardWebView()
                    : SizedBox.fromSize(),
              ],
            ),
      ),
    );
  }
}



