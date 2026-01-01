import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/view_models/home_view_model.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/text_style_data_column_widget.dart';

class DateTableWidget extends StatelessWidget {
  const DateTableWidget({
    super.key,
    required this.verticalPadding,
    required this.horizontalPadding,
  });

  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    double cellFontSize = (ScreenSize.w(context) * 0.03).clamp(10, 14);

    return Consumer2<BookingViewModel, HomeViewModel>(
      builder:
          (context, provBooking, provHome, child) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: ScreenSize.w(context) * 0.05,
              headingRowHeight: (ScreenSize.h(context) * 0.06).clamp(40, 60),

              columns: [
                DataColumn(label: TextStyleDataColumnWidget(txt: 'Users')),
                DataColumn(label: TextStyleDataColumnWidget(txt: 'Email')),
                DataColumn(label: TextStyleDataColumnWidget(txt: 'Service')),
                DataColumn(label: TextStyleDataColumnWidget(txt: 'Date')),
                DataColumn(label: TextStyleDataColumnWidget(txt: 'Time')),
                DataColumn(label: TextStyleDataColumnWidget(txt: 'Status')),
                DataColumn(label: TextStyleDataColumnWidget(txt: 'Action')),
              ],
              rows:
                  provBooking.allUsersBookings.map((e) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            e.provider,
                            style: TextStyle(fontSize: cellFontSize),
                          ),
                        ),
                        DataCell(
                          Text(
                            e.email,
                            style: TextStyle(fontSize: cellFontSize),
                          ),
                        ),
                        DataCell(
                          Text(
                            e.serviceName,
                            style: TextStyle(fontSize: cellFontSize),
                          ),
                        ),
                        DataCell(
                          Text(
                            e.date,
                            style: TextStyle(fontSize: cellFontSize),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: (ScreenSize.w(context) * 0.08).clamp(
                              50,
                              120,
                            ),
                            child: Text(
                              e.time,
                              style: TextStyle(fontSize: cellFontSize),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: verticalPadding * 0.4,
                              horizontal: horizontalPadding * 0.5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                (ScreenSize.w(context) * 0.015).clamp(4, 8),
                              ),
                              color:
                                  e.status == 'InProgress'
                                      ? Colors.blue
                                      : e.status == 'Pending'
                                      ? Colors.orange
                                      : e.status == 'Completed'
                                      ? Colors.green
                                      : Colors.red,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  e.status == 'InProgress'
                                      ? Icons.access_time_outlined
                                      : e.status == 'Pending'
                                      ? Icons.calendar_today_outlined
                                      : e.status == 'Completed'
                                      ? Icons.done_all
                                      : Icons.cancel,
                                  color: Colors.white,
                                  size: (ScreenSize.w(context) * 0.03).clamp(
                                    12,
                                    16,
                                  ),
                                ),
                                SizedBox(width: ScreenSize.w(context) * 0.01),
                                Flexible(
                                  child: Text(
                                    provHome.status.isEmpty
                                        ? e.status
                                        : provHome.status,
                                    style: AppStyle.body15(context).copyWith(
                                      color: Colors.white,
                                      fontSize: cellFontSize,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataCell(
                          PopupMenuButton(
                            onSelected: (value) async {
                              await provBooking.updateBookingStatus(
                                lastUpdatedBy: 'web',
                                idUser: e.userId,
                                idbook: e.id!,
                                status: value,
                              );
                            },
                            itemBuilder:
                                (context) => [
                                  PopupMenuItem(
                                    value: 'Pending',
                                    child: Text(
                                      'Pending',
                                      style: TextStyle(fontSize: cellFontSize),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'InProgress',
                                    child: Text(
                                      'InProgress',
                                      style: TextStyle(fontSize: cellFontSize),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'Completed',
                                    child: Text(
                                      'Completed',
                                      style: TextStyle(fontSize: cellFontSize),
                                    ),
                                  ),
                                ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
            ),
          ),
    );
  }
}
