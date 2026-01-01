import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/responsive_config.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/all_bookings_table_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/bar_chart_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/stastics_grid_view_widget.dart';

class DashboardWebView extends StatelessWidget {
  const DashboardWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = (ScreenSize.w(context) * 0.04).clamp(
      16,
      32,
    );
    final double verticalPadding = (ScreenSize.h(context) * 0.02).clamp(10, 20);
    final double spacingSmall = (ScreenSize.h(context) * 0.015).clamp(5, 15);
    final double spacingMedium = (ScreenSize.h(context) * 0.03).clamp(15, 30);

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: spacingMedium),
              Text(
                'Dashboard ',
                style: AppStyle.body30(context).copyWith(
                  fontSize: (ScreenSize.w(context) * 0.04).clamp(24, 32),
                ),
              ),
              SizedBox(height: spacingSmall),
              Divider(),
              Text(
                'Bookings Overview',
                style: AppStyle.body17(context).copyWith(
                  fontSize: (ScreenSize.w(context) * 0.035).clamp(14, 18),
                ),
              ),
              Text(
                'Summary of today’s booking activity and performance..',
                style: AppStyle.hintTextStyle(context).copyWith(
                  fontSize: (ScreenSize.w(context) * 0.03).clamp(12, 16),
                ),
              ),
              SizedBox(height: spacingSmall),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxixCount = 0;
                  final confgResponsive = ResponsiveConfig.fromConstraints(
                    constraints,
                    context,
                    crossAxixCount,
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatisticsGridViewWidget(
                        crossAxixCount: confgResponsive.crossAxisCount!.toInt(),
                        horizontalPadding: confgResponsive.horizontalPadding,
                        verticalPadding: confgResponsive.verticalPadding,
                        titleFontSize: confgResponsive.titleFontSize,
                        countFontSize: confgResponsive.countFontSize,
                        iconSize: confgResponsive.iconSize,
                      ),
                      SizedBox(height: spacingMedium),
                      Text(
                        'Bookings Performance (Last 7 Days)',
                        style: AppStyle.body17(context).copyWith(
                          fontSize: (ScreenSize.w(context) * 0.035).clamp(
                            14,
                            18,
                          ),
                        ),
                      ),
                      Text(
                        'Track total and daily booking trends over the past week',
                        style: AppStyle.hintTextStyle(context).copyWith(
                          fontSize: (ScreenSize.w(context) * 0.03).clamp(
                            12,
                            16,
                          ),
                        ),
                      ),
                      SizedBox(height: spacingSmall),
                      BarChartWidget(),
                      SizedBox(height: spacingMedium),
                      AllBookingsTableWidget(
                        horizontalPadding: confgResponsive.horizontalPadding,
                        verticalPadding: confgResponsive.verticalPadding,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
