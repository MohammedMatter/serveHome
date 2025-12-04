import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/views/mobile/home_view_mobile.dart';
import 'package:serve_home/features/home/presentation/views/web/home_web_view.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_)  {
       fetchAllBookings();
       fetchServices();
    });
  }


  Future fetchAllBookings() async {
    final provBookings = Provider.of<BookingViewModel>(context, listen: false);
    await provBookings.fetchAllBookings(idUser: "ABQ4EkIh4cbQDoyDQZZfd55p81k1");
    await provBookings.fetchAllUsersBookings();
    await provBookings.fetchInProgressBookings(
      idUser: "ABQ4EkIh4cbQDoyDQZZfd55p81k1",
    );
    await provBookings.fetchComoletedBookings(
      idUser: "ABQ4EkIh4cbQDoyDQZZfd55p81k1",
    );
    await provBookings.fetchCanceledBookings(
      idUser: "ABQ4EkIh4cbQDoyDQZZfd55p81k1",
    );
    await provBookings.fetchPendingBookings(
      idUser: "ABQ4EkIh4cbQDoyDQZZfd55p81k1",
    );
  }

  Future fetchServices() async {
    final provService = Provider.of<ServiceViewModel>(context, listen: false);
    await provService.getServices();
  }

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? HomeWebView() : HomeViewMobile();
  }
}
