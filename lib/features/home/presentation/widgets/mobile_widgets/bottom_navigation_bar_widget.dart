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
              if (index == provHome.bottomNavigationBarIndex) {
                return;
              }
              provHome.changeBottomNavigationBarIndex(index);

              switch (provHome.bottomNavigationBarIndex) {
                case 0:
                  GoRouter.of(context).pushReplacementNamed(AppRouter.homeView);
                case 1:
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouter.allServicesView);
                case 2:
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouter.bookingsListView);
                case 3:
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouter.notificationView);
                case 4:
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouter.profileView);
              }
            },
            items: [
              SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),
              SalomonBottomBarItem(
                icon: Icon(Icons.home_repair_service),
                title: Text('Services'),
              ),
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
