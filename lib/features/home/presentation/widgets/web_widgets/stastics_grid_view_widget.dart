
import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
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
    return SizedBox(
      width: ScreenSize.w(context) * 0.9,
    
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount:
            DashboardItem.dashboardItems.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 0.6,
              crossAxisSpacing: 8,
              crossAxisCount: crossAxixCount,
              mainAxisSpacing: 8,
            ),
        itemBuilder:
            (context, index) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              decoration: BoxDecoration(
                color: DashboardItem
                    .dashboardItems[index]
                    .color
                    .withOpacity(0.3),
                borderRadius:
                    BorderRadius.circular(8),
                border: Border.all(
                  color:
                      DashboardItem
                          .dashboardItems[index]
                          .color,
                  width: 0.65,
                ),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceEvenly,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        DashboardItem
                            .dashboardItems[index]
                            .title,
                        style: AppStyle.body15
                            .copyWith(
                              fontSize:
                                  titleFontSize,
                              fontWeight:
                                  FontWeight.w400,
                            ),
                      ),
                      Text(
                        DashboardItem
                            .dashboardItems[index]
                            .count
                            .toString(),
                        style: AppStyle
                            .hintTextStyle
                            .copyWith(
                              fontSize:
                                  countFontSize,
                              fontWeight:
                                  FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    decoration: BoxDecoration(
                      color:
                          DashboardItem
                              .dashboardItems[index]
                              .color,
                      borderRadius:
                          BorderRadius.circular(
                            8,
                          ),
                    ),
                    child: Icon(
                      color: Colors.white,
                      DashboardItem
                          .dashboardItems[index]
                          .icon,
                      size: iconSize,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}