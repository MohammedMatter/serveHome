import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardItem {
  final String title;
  final IconData icon;
  final int count;
  final Color color;
  DashboardItem({
    required this.title,
    required this.icon,
    required this.count,
    required this.color,
  });

  static List<DashboardItem> dashboardItems = [
    DashboardItem(
      title: 'New Bookings Today',
      icon: Icons.calendar_today_outlined,
      count: 2,
      color: Colors.orange,
    ),
       DashboardItem(
      title: 'InProgress Bookings',
      icon: Icons.access_time_rounded,
      count: 5,
      color: Colors.blue,
    ),
   
    DashboardItem(
      title: 'Completed Today',
      icon: Icons.done_outline_outlined,
      count: 8,
      color: Colors.green,
    ),
 
  DashboardItem(
      title: 'Active Bookings',
      icon: Icons.bar_chart_outlined,
      count: 1,
      color: Colors.deepPurpleAccent,
    ),

  ];
}
