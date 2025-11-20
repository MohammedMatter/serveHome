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
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenSize.h(context) * 0.03),
               Text('Dashboard ', style: AppStyle.body30),
              SizedBox(height: 5),
              Divider(),
              Text('Bookings Overview', style: AppStyle.body17),
              Text(
                'Summary of today’s booking activity and performance..',
                style: AppStyle.hintTextStyle,
              ),
              SizedBox(height: 15),
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
                      SizedBox(height: 30),
                      Text(
                        'Bookings Performance (Last 7 Days)',
                        style: AppStyle.body17,
                      ),
                      Text(
                        'Track total and daily booking trends over the past week',
                        style: AppStyle.hintTextStyle,
                      ),
                      SizedBox(height: 15),
                      BarChartWidget(),
                      SizedBox(height: 30),
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
