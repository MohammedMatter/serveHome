
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
    return Consumer2<BookingViewModel, HomeViewModel>(
      builder:
          (context, provBooking, provHome, child) => DataTable(
            
            columnSpacing: ScreenSize.w(context) * 0.08,

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
                provBooking.allUsersBookings
                    .map(
                      (e) => DataRow(
                        cells: [
                          DataCell(Text(e.provider)),
                          DataCell(Text(e.email)),
                          DataCell(Text(e.serviceName)),
                          DataCell(Text(e.date)),
                          DataCell(SizedBox(
                            width: ScreenSize.w(context)*0.04,
                            child: Text(e.time))),
                          DataCell(
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: verticalPadding,
                                horizontal: horizontalPadding,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    e.status == 'InProgress'
                                        ? Colors.blue
                                        : e.status == 'Pending'
                                        ? Colors.orange
                                        : Colors.green,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                       e.status == 'InProgress'
                                        ?    Icons.access_time_outlined
                                        : e.status == 'Pending'
                                        ?  Icons.calendar_today_outlined
                                        :  Icons.done_all   ,  
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    provHome.status.isEmpty
                                        ? e.status
                                        : provHome.status,
                                    style: AppStyle.body15.copyWith(
                                      color: Colors.white,
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
                                  idUser: e.userId,
                                  idbook: e.id!,
                                  status: value,
                                );
                              },
                              itemBuilder:
                                  (context) => [
                                    PopupMenuItem(
                                      value: 'Pending',
                                      child: Text('Pending'),
                                    ),
                                    PopupMenuItem(
                                      value: 'InProgress',
                                      child: Text('InProgress'),
                                    ),
                                    PopupMenuItem(
                                      value: 'Completed',
                                      child: Text('Completed'),
                                    ),
                                  ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
          ),
    );
  }
}
