import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardItem {
  final String title;
  final IconData icon;
  final Color color;
  DashboardItem({
    required this.title,
    required this.icon,
    required this.color,
  });

  static List<DashboardItem> dashboardItems = [
    DashboardItem(
      title: 'Pending Bookings',
      icon: Icons.calendar_today_outlined,
      color: Colors.orange,
    ),
       DashboardItem(
      title: 'InProgress Bookings',
      icon: Icons.access_time_rounded,
      color: Colors.blue,
    ),
   
    DashboardItem(
      title: 'Completed Bookings',
      icon: Icons.done_outline_outlined,
      color: Colors.green,
    ),
 
  DashboardItem(
      title: 'Canceled Bookings',
      icon: Icons.cancel_outlined,
      color: Colors.red,
    ),

  ];
}
