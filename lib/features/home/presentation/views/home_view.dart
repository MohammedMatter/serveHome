import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/views/mobile/home_view_mobile.dart';
import 'package:serve_home/features/home/presentation/views/web/home_web_view.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, auth, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<BookingViewModel>().fetchAllUsersBookings();

          if (!kIsWeb) {
            context.read<BookingViewModel>().fetchAllBookings(
              idUser: auth.user!.id!,
            );

            context.read<BookingViewModel>().fetchInProgressBookings(
              idUser: auth.user!.id!,
            );
            context.read<BookingViewModel>().fetchCompletedBookings(
              idUser: auth.user!.id!,
            );
            context.read<BookingViewModel>().fetchCanceledBookings(
              idUser: auth.user!.id!,
            );
            context.read<BookingViewModel>().fetchPendingBookings(
              idUser: auth.user!.id!,
            );

            context.read<ServiceViewModel>().getServices();
          }
        });

        return kIsWeb ? HomeWebView() : HomeViewMobile();
      },
    );
  }
}
