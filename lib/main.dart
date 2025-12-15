import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/notifications/firebase_messaging_service.dart';
import 'package:serve_home/core/notifications/notification_service.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/features/auth/domain/use_cases/listen_to_user_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:serve_home/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/booking/domain/use_cases/create_booking_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_all_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_all_users_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_bookings_by_status_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/get_address_from_lat_lng_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/get_current_location_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/update_status_book_use_case.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/location_view_model.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:serve_home/features/notification/domain/use_cases/add_notification_use_case.dart';
import 'package:serve_home/features/notification/domain/use_cases/get_notification_use_Case.dart';
import 'package:serve_home/features/notification/domain/use_cases/mark_as_read_use_case.dart';
import 'package:serve_home/features/notification/presentation/view_models/notification_view_model.dart';
import 'package:serve_home/features/profile/domain/use_cases/update_user_data_use_case.dart';
import 'package:serve_home/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:serve_home/features/services/domain/user_cases/add_services_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/delete_service_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/get_categories_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/get_services_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/update_service_use_case.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';
import 'package:serve_home/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await NotificationService.init();
    await FirebaseMessagingService.init();
  }

  // Directory appDocDir = await getApplicationDocumentsDirectory();
  // String path = appDocDir.path;
  // Hive.init(path);

  runApp(const MyApp());
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Background Message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeViewModel(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create:
                (context) => ProfileViewModel(
                  updateUserDataUseCase: UpdateUserDataUseCase(),
                ),
            lazy: false,
          ),

          ChangeNotifierProvider(
            create:
                (context) => LocationViewModel(
                  getCurrentLocationUseCase: GetCurrentLocationUseCase(),
                  getAddressFromLatLngUseCase: GetAddressFromLatLngUseCase(),
                ),
          ),
          ChangeNotifierProvider(
            create:
                (context) => ServiceViewModel(
                  addServicesUseCase: AddServicesUseCase(),
                  getServicesUseCase: GetServicesUseCase(),
                  deleteServiceUseCase: DeleteServiceUseCase(),
                  updateServiceUseCase: UpdateServiceUseCase(),
                  getCategoriesUseCase: GetCategoriesUseCase(),
                ),
          ),
          ChangeNotifierProvider(
            create:
                (context) => BookingViewModel(
                  notificationViewModel: NotificationViewModel(serviceViewModel: ServiceViewModel(getCategoriesUseCase: GetCategoriesUseCase(), addServicesUseCase: AddServicesUseCase(), getServicesUseCase: GetServicesUseCase(), deleteServiceUseCase: DeleteServiceUseCase(), updateServiceUseCase: UpdateServiceUseCase()), addNotificationUseCase: AddNotificationUseCase(), markAsReadUseCase: MarkAsReadUseCase(), getNotificationUseCase: GetNotificationUseCase()),
                  fetchBookingsByStatusUseCase: FetchBookingsByStatusUseCase(),
                  createBookingUseCase: CreateBookingUseCase(),
                  fetchAllBookingsUseCase: FetchAllBookingsUseCase(),
                  updateStatusBookUseCase: UpdateStatusBookUseCase(),
                  fetchAllUsersBookingsUseCase: FetchAllUsersBookingsUseCase(),
                ),
          ),
          ChangeNotifierProvider(
            create:
                (context) => AuthViewModel(
                  signOutUseCase: SignOutUseCase(),
                  listenToUserUseCase: ListenToUserUseCase(),
                  signUpUseCase: SignUpUseCase(),
                  signInUseCase: SignInUseCase(),
                ),
          ),
          ChangeNotifierProvider(
            create:
                (context) => NotificationViewModel(
                  serviceViewModel: ServiceViewModel(
                    getCategoriesUseCase: GetCategoriesUseCase(),
                    addServicesUseCase: AddServicesUseCase(),
                    getServicesUseCase: GetServicesUseCase(),
                    deleteServiceUseCase: DeleteServiceUseCase(),
                    updateServiceUseCase: UpdateServiceUseCase(),
                  ),
                  addNotificationUseCase: AddNotificationUseCase(),
                  getNotificationUseCase: GetNotificationUseCase(),
                  markAsReadUseCase: MarkAsReadUseCase(),
                ),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData().copyWith(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.routers,
        ),
      ),
    );
  }
}
