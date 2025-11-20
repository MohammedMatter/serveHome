import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder:
          (context, provHome, child) => SalomonBottomBar(
            selectedColorOpacity: 0.08,
            curve: Curves.fastEaseInToSlowEaseOut,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.primary,
            backgroundColor: Colors.white,
            currentIndex: provHome.bottomNavigationBarIndex,
            onTap: (index) {
              provHome.changeBottomNavigationBarIndex(index);
              provHome.bottomNavigationBarIndex == 1
                  ? GoRouter.of(context).pushReplacementNamed(AppRouter.bookingsListView)
                  : GoRouter.of(context).pushReplacementNamed(AppRouter.homeView);
            },
            items: [
              SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),

              SalomonBottomBarItem(
                icon: Icon(Icons.event),
                title: Text('Bookings'),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.notifications_none_outlined),
                title: Text('Notifications'),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.person_2_outlined),
                title: Text('Profile'),
              ),
            ],
          ),
    );
  }
}
