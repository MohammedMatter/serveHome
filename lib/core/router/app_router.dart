import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/auth/presentation/views/sign_in_view.dart';
import 'package:serve_home/features/auth/presentation/views/sign_up_view.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/views/bookings_list_view.dart';
import 'package:serve_home/features/booking/presentation/views/complete_view.dart';
import 'package:serve_home/features/booking/presentation/views/fitst_book_view.dart';
import 'package:serve_home/features/booking/presentation/views/second_book_view.dart';
import 'package:serve_home/features/booking/presentation/views/third_book_view.dart';
import 'package:serve_home/features/booking/presentation/views/track_order_view.dart';
import 'package:serve_home/features/home/presentation/views/home_view.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/views/service_details_view.dart';

class AppRouter {
  static final String homeView = 'HomeView';
  static final String fitstBookView = 'Fitst Book View';
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
  static final routers = GoRouter(
    initialLocation: '/signInView',
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
        path: '/bookingsListView',
        name: bookingsListView,
        builder: (context, state) => BookingsListView(),
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
        path: '/fitstBookView',
        name: fitstBookView,
        onExit: (context, state) {
          final proBook = Provider.of<BookingViewModel>(context, listen: false);
          proBook.changeTimeIndex(-1);
          return true;
        },
        builder: (context, state) => FitstBookView(),
      ),
      GoRoute(
        path: '/secondBookView',
        name: secondBookView,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: Duration(seconds: 1),
              child: SecondBookView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
      ),
      GoRoute(
        path: '/thirdBookView',
        name: thirdBookView,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: Duration(seconds: 1),
              child: ThirdBookView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
        onExit: (context, state) {
          final proBook = Provider.of<BookingViewModel>(context, listen: false);
          proBook.changePaymentMethodIndex(-1);
          return true;
        },
      ),
      GoRoute(
        path: '/trackOrderView',
        name: trackOrderView,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: Duration(seconds: 1),
              child: TrackOrderView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
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
    ],
  );
}
