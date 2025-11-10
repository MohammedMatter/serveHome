import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';

class CompleteView extends StatelessWidget {
  const CompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarDetailsWidget(
        navigationToAnotherScreen: () {
          GoRouter.of(context).pushReplacementNamed(AppRouter.homeView) ; 
        },
        label: 'Return To Home Page',
        icon: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: const Color.fromARGB(255, 181, 233, 183),
              child: Icon(
                Icons.check_circle_outline,
                color: const Color.fromARGB(255, 48, 126, 51),
                size: 40,
              ),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                Text(
                  'The booking has been successfully confirmed 🎉',
                  style: AppStyle.body19,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'The technician will contact you soon.',
                  style: AppStyle.body19.copyWith(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
