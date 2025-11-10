import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/booking/domain/use_cases/create_booking_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_all_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_in_progress_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/get_address_from_lat_lng_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/get_current_location_use_case.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/location_view_model.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:serve_home/features/services/domain/user_cases/get_services_use_case.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => LocationViewModel(getCurrentLocationUseCase: GetCurrentLocationUseCase() , getAddressFromLatLngUseCase: GetAddressFromLatLngUseCase())),
        ChangeNotifierProvider(create: (context) => ServiceViewModel(getServicesUseCase: GetServicesUseCase())),
        ChangeNotifierProvider(create: (context) => BookingViewModel(createBookingUseCase : CreateBookingUseCase() , fetchAllBookingsUseCase: FetchAllBookingsUseCase() , fetchInProgressBookingsUseCase: FetchInProgressBookingsUseCase()) ),
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(signUpUseCase: SignUpUseCase() , signInUseCase: SignInUseCase()),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData().copyWith(scaffoldBackgroundColor: Color(0xfff2f1f1)),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.routers,
      ),
    );
  }
}
