import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/domain/entities/dashboard.dart';

class StatisticsGridViewWidget extends StatelessWidget {
  const StatisticsGridViewWidget({
    super.key,
    required this.crossAxixCount,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.titleFontSize,
    required this.countFontSize,
    required this.iconSize,
  });

  final int crossAxixCount;
  final double horizontalPadding;
  final double verticalPadding;
  final double titleFontSize;
  final double countFontSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    double width = ScreenSize.w(context) * 0.9;
    double borderRadius = (ScreenSize.w(context) * 0.02).clamp(6, 12);
    double spacing = (ScreenSize.w(context) * 0.02).clamp(6, 12);

    return Consumer<BookingViewModel>(
      builder:
          (context, provBooking, child) => SizedBox(
            width: width,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: DashboardItem.dashboardItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxixCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio:
                    (ScreenSize.w(context) / crossAxixCount) /
                    ((ScreenSize.h(context) * 0.15).clamp(80, 120)),
              ),
              itemBuilder: (context, index) {
                final statuses = [
                  'Pending',
                  'InProgress',
                  'Completed',
                  'Canceled',
                ];
                final count =
                    provBooking.allUsersBookings
                        .where((e) => e.status == statuses[index])
                        .length;
                final item = DashboardItem.dashboardItems[index];
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: item.color.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(color: item.color, width: 0.65),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: AppStyle.body15(context).copyWith(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            count.toString(),
                            style: AppStyle.hintTextStyle(context).copyWith(
                              fontSize: countFontSize,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding,
                        ),
                        decoration: BoxDecoration(
                          color: item.color,
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        child: Icon(
                          item.icon,
                          color: Colors.white,
                          size: iconSize,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
    );
  }
}
