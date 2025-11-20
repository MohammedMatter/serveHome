// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/responsive_config.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/all_bookings_table_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/drawer_widget.dart';

class BookingsWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            DrawerWidget(),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final configResponsive = ResponsiveConfig.fromConstraints(
                    constraints,
                    context,
                    null,
                  );
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: configResponsive.horizontalPadding,
                      vertical: configResponsive.verticalPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'All Bookings',
                            style: AppStyle.body19
                          ),
                        ),
                        AllBookingsTableWidget(
                          horizontalPadding: configResponsive.horizontalPadding,
                          verticalPadding: configResponsive.verticalPadding,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
