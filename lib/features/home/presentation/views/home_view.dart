import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/views/mobile/home_view_mobile.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAllBookings();
      fetchServices();
    });
  }

  Future fetchAllBookings() async {
    final provBookings = Provider.of<BookingViewModel>(context, listen: false);
    final provAuth = Provider.of<AuthViewModel>(context, listen: false);
    await provBookings.fetchAllBookings(idUser: provAuth.user!.id!);
    log(provAuth.user!.id!) ; 
    log("provAuth.user!.id!") ; 
    await provBookings.fetchAllUsersBookings();
    provBookings.fetchInProgressBookings(idUser: provAuth.user!.id!);
    provBookings.fetchComoletedBookings(idUser: provAuth.user!.id!);
    provBookings.fetchCanceledBookings(idUser: provAuth.user!.id!);
    provBookings.fetchPendingBookings(idUser: provAuth.user!.id!);
  }

  Future fetchServices() async {
    final provService = Provider.of<ServiceViewModel>(context, listen: false);
    await provService.getServices();
  }

  @override
  //kIsWeb ? HomeWebView() :
  Widget build(BuildContext context) {
    return HomeViewMobile();
  }
}
