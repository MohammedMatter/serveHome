
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/auth/presentation/views/sign_in_view.dart';
import 'package:serve_home/features/auth/presentation/views/sign_up_view.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/views/bookings_list_view.dart';
import 'package:serve_home/features/booking/presentation/views/complete_view.dart';
import 'package:serve_home/features/booking/presentation/views/first_book_view.dart';
import 'package:serve_home/features/booking/presentation/views/second_book_view.dart';
import 'package:serve_home/features/booking/presentation/views/third_book_view.dart';
import 'package:serve_home/features/booking/presentation/views/track_order_view.dart';
import 'package:serve_home/features/home/presentation/views/home_view.dart';
import 'package:serve_home/features/home/presentation/views/web/bookings_web_view.dart';
import 'package:serve_home/features/home/presentation/views/web/dashboard_web_view.dart';
import 'package:serve_home/features/home/presentation/views/web/home_web_view.dart';
import 'package:serve_home/features/notification/presentation/views/notification_view.dart';
import 'package:serve_home/features/profile/presentation/views/about_app_view.dart';
import 'package:serve_home/features/profile/presentation/views/change_password_view.dart';
import 'package:serve_home/features/profile/presentation/views/profile_view.dart';
import 'package:serve_home/features/profile/presentation/views/settings_view.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/views/mobile/all_services_view.dart';
import 'package:serve_home/features/services/presentation/views/mobile/category_services_view.dart';
import 'package:serve_home/features/services/presentation/views/mobile/service_details_view.dart';
import 'package:serve_home/features/services/presentation/views/web/service_web_view.dart';

class AppRouter {
  static final String homeView = 'HomeView';
  static final String firstBookView = 'First Book View';
  static final String serviceDetailsView = 'Service Details view';
  static final String secondBookView = 'Second Book View';
  static final String thirdBookView = 'Third Book View';
  static final String trackOrderView = 'Track kOrder View';
  static final String completeView = 'Complete View';
  static final String signInView = 'SignIn View';
  static final String signUpView = 'SignUp View';
  static final String notificationView = 'Notification View';
  static final String bookingsListView = 'Bookings List View';
  static final String profileView = 'Profile View';
  static final String dashboardViewWeb = 'Dashboard Web View';
  static final String bookingsWebView = 'Bookings Web View';
  static final String homeWebView = 'HomeWebView';
  static final String servicesWebView = 'Services Web View';
  static final String categoriesWebView = 'Categories Web View';
  static final String categoryServicesView = 'Category Services View';
  static final String allServicesView = 'All Services View';
  static final String settingsView = 'Settings View';
  static final String changePasswordView = 'Change Password View';
  static final String aboutAppView = 'About App View';

  bool isLogin;
  AppRouter({required this.isLogin});
  late final routers = GoRouter(
    initialLocation: isLogin ? '/home' : '/signInView',

    routes: [
      GoRoute(
        path: '/signInView',
        name: signInView,
        builder: (context, state) => SignInView(),
      ),
      GoRoute(
        path: '/signUpView',
        name: signUpView,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: '/home',
        name: homeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: '/profileView',
        name: profileView,
        builder: (context, state) => ProfileView(),
      ),
      GoRoute(
        path: '/aboutAppView',
        name: aboutAppView,
        builder: (context, state) => AboutAppView(),
      ),
      GoRoute(
        path: '/settingsView',
        name: settingsView,
        builder: (context, state) => SettingsView(),
      ),
      GoRoute(
        path: '/changePasswordView',
        name: changePasswordView,
        builder: (context, state) => ChangePasswordView(),
      ),
      GoRoute(
        path: '/allServicesView',
        name: allServicesView,
        builder: (context, state) => AllServicesView(),
      ),

      GoRoute(
        path: '/bookingsListView',
        name: bookingsListView,
        builder: (context, state) => BookingsListView(),
      ),
      GoRoute(
        path: '/categoryServicesView',
        name: categoryServicesView,
        builder: (context, state) => CategoryServicesView(),
      ),
      GoRoute(
        path: '/notificationView',
        name: notificationView,
        builder: (context, state) => NotificationView(),
      ),
      GoRoute(
        path: '/serviceDetails',
        name: serviceDetailsView,
        builder: (context, state) {
          final service = state.extra as ServiceModel;
          return ServiceDetailsView(service: service);
        },
      ),
      GoRoute(
        path: '/firstBookView',
        name: firstBookView,

        onExit: (context, state) {
          final proBook = Provider.of<BookingViewModel>(context, listen: false);
          proBook.changeTimeIndex(-1);
          return true;
        },

        builder: (context, state) {
          final service = state.extra as ServiceModel;
          return FirstBookView(service: service);
        },
      ),
      GoRoute(
        path: '/secondBookView',
        name: secondBookView,
        pageBuilder: (context, state) {
          final ServiceModel serviceModel = state.extra as ServiceModel;
          return CustomTransitionPage(
            transitionDuration: Duration(seconds: 1),
            child: SecondBookView(serviceModel: serviceModel),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        },
      ),
      GoRoute(
        path: '/thirdBookView',
        name: thirdBookView,
        pageBuilder: (context, state) {
          final service = state.extra as ServiceModel;
          return CustomTransitionPage(
            transitionDuration: Duration(seconds: 1),
            child: ThirdBookView(serviceModel: service),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        },
        onExit: (context, state) {
          final proBook = Provider.of<BookingViewModel>(context, listen: false);
          proBook.changePaymentMethodIndex(-1);
          return true;
        },
      ),
      GoRoute(
        path: '/trackOrderView',
        name: trackOrderView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: Duration(seconds: 1),
            child: TrackOrderView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        },
      ),
      GoRoute(
        path: '/completeView',
        name: completeView,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: Duration(seconds: 1),
              child: CompleteView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
      ),

      GoRoute(
        path: '/bookingsWebView',
        name: bookingsWebView,
        builder: (context, state) {
          return BookingsWebView();
        },
      ),
      GoRoute(
        path: '/dashboardWebView',
        name: dashboardViewWeb,
        builder: (context, state) {
          return DashboardWebView();
        },
      ),
      GoRoute(
        path: '/homeWebView',
        name: homeWebView,
        builder: (context, state) {
          return HomeWebView();
        },
      ),
      GoRoute(
        path: '/servicesWebView',
        name: servicesWebView,
        builder: (context, state) {
          return ServicesWebView();
        },
      ),
    ],
  );
}
