import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double containerHeight = (ScreenSize.h(context) * 0.7).clamp(300, 650);
    final double horizontalPadding = (ScreenSize.w(context) * 0.04).clamp(16, 20);
    final double verticalPadding = (ScreenSize.h(context) * 0.03).clamp(10, 25);
    final double spacingWidth = (ScreenSize.w(context) * 0.05).clamp(15, 25);
    final double verticalSpacing = (ScreenSize.h(context) * 0.03).clamp(10, 25);
    final double circleRadius = (ScreenSize.w(context) * 0.045).clamp(15, 25);
    final double iconSize = (ScreenSize.w(context) * 0.045).clamp(15, 25);
    final double dividerHeight = (ScreenSize.h(context) * 0.05).clamp(30, 50);
    final double fontSize = (ScreenSize.w(context) * 0.035).clamp(12, 16);

    return Consumer<BookingViewModel>(
      builder: (context, provBooking, child) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          height: containerHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Status', style: AppStyle.body15(context).copyWith(fontSize: fontSize)),
                SizedBox(height: verticalSpacing),
                ..._buildStatusRow(
                  context,
                  iconColor: Color.fromARGB(255, 58, 201, 112),
                  bgColor: Color.fromARGB(255, 219, 252, 231),
                  title: 'Booking Confirmed',
                  subtitle: provBooking.selectedTime,
                  circleRadius: circleRadius,
                  iconSize: iconSize,
                  dividerHeight: dividerHeight,
                  spacingWidth: spacingWidth,
                  fontSize: fontSize,
                ),
                ..._buildStatusRow(
                  context,
                  iconColor: Color.fromARGB(255, 58, 201, 112),
                  bgColor: Color.fromARGB(255, 219, 252, 231),
                  title: 'Professional Assigned',
                  subtitle: provBooking.selectedTime,
                  circleRadius: circleRadius,
                  iconSize: iconSize,
                  dividerHeight: dividerHeight,
                  spacingWidth: spacingWidth,
                  fontSize: fontSize,
                ),
                ..._buildStatusRow(
                  context,
                  iconColor: Colors.grey.shade400,
                  bgColor: AppColor.filledTextField,
                  title: 'On the Way',
                  subtitle: 'Expected 10:45 AM',
                  circleRadius: circleRadius,
                  iconSize: 13,
                  dividerHeight: dividerHeight,
                  spacingWidth: spacingWidth,
                  fontSize: fontSize,
                ),
                ..._buildStatusRow(
                  context,
                  iconColor: Colors.grey.shade400,
                  bgColor: AppColor.filledTextField,
                  title: 'Service in Progress',
                  subtitle: null,
                  circleRadius: circleRadius,
                  iconSize: 13,
                  dividerHeight: dividerHeight,
                  spacingWidth: spacingWidth,
                  fontSize: fontSize,
                ),
                ..._buildStatusRow(
                  context,
                  iconColor: Colors.grey.shade400,
                  bgColor: AppColor.filledTextField,
                  title: 'Completed',
                  subtitle: null,
                  circleRadius: circleRadius,
                  iconSize: 13,
                  dividerHeight: dividerHeight,
                  spacingWidth: spacingWidth,
                  fontSize: fontSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStatusRow(
    BuildContext context, {
    required Color iconColor,
    required Color bgColor,
    required String title,
    String? subtitle,
    required double circleRadius,
    required double iconSize,
    required double dividerHeight,
    required double spacingWidth,
    required double fontSize,
  }) {
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: circleRadius,
                backgroundColor: bgColor,
                child: Icon(
                  iconColor == Colors.grey.shade400 ? Icons.circle : Icons.check,
                  size: iconSize,
                  color: iconColor,
                ),
              ),
              SizedBox(
                height: dividerHeight,
                child: VerticalDivider(
                  color: iconColor,
                  thickness: 2,
                ),
              ),
            ],
          ),
          SizedBox(width: spacingWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyle.body15(context).copyWith(fontSize: fontSize, color: iconColor == Colors.grey.shade400 ? Colors.grey : null)),
              if (subtitle != null)
                SizedBox(height: 5),
              if (subtitle != null)
                Text(subtitle, style: AppStyle.body15(context).copyWith(fontSize: fontSize, color: Colors.grey)),
            ],
          ),
        ],
      ),
      SizedBox(height: spacingWidth),
    ];
  }
}
