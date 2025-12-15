
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/views/mobile/home_view_mobile.dart';
import 'package:serve_home/features/home/presentation/views/web/home_web_view.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_)  {
       fetchAllBookings();
       fetchServices();
    });
  }


  Future fetchAllBookings() async {
    final provBookings = Provider.of<BookingViewModel>(context, listen: false);
    await provBookings.fetchAllBookings(idUser: "zW5KVTaKz4P1CPDtKr3vSdrrcjv1");
    await provBookings.fetchAllUsersBookings();
     provBookings.fetchInProgressBookings(
      idUser: "zW5KVTaKz4P1CPDtKr3vSdrrcjv1",
    );
     provBookings.fetchComoletedBookings(
      idUser: "zW5KVTaKz4P1CPDtKr3vSdrrcjv1",
    );
    provBookings.fetchCanceledBookings(
      idUser: "zW5KVTaKz4P1CPDtKr3vSdrrcjv1",
    );
     provBookings.fetchPendingBookings(
      idUser: "zW5KVTaKz4P1CPDtKr3vSdrrcjv1",
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
