import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/booking/presentation/widgets/booking_status_tab_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/bookings_header_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/booking_image_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/labeled_info_widget.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/bottom_navigation_bar_widget.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

// ignore: must_be_immutable
class BookingsListView extends StatelessWidget {
  BookingsListView({super.key});
  List statusBookings = [
    'All',
    'Pending',
    'In Progress ',
    'Completed ',
    'Canceled ',
  ];
  @override
  Widget build(BuildContext context) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(),
      
        body: Consumer2<BookingViewModel, ServiceViewModel>(
          builder:
              (context, provBooking, provService, child) => Column(
                children: [
                  BookingsHeaderWidget(),
                  SizedBox(height: 35),
                  Expanded(
                    child: Column(
                      children: [
                        BookingStatusTabWidget(statusBookings: statusBookings),
                        SizedBox(height: 30),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),
                              child: Column(
                                children:
                                    provBooking.selectedBookings.isNotEmpty
                                        ? provBooking.selectedBookings
                                            .map(
                                              (book) => Container(
                                                padding: EdgeInsets.only(
                                                  bottom: 15,
                                                ),
                                                margin: EdgeInsets.only(
                                                  bottom: 15,
                                                ),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white,
                                                ),
                    
                                                width: double.infinity,
                    
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    BookingImageWidget(
                                                      book: book,
                                                    ),
                                                    SizedBox(height: 20),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                          ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Text(
                                                              book.serviceName,
                                                              style:
                                                                  AppStyle
                                                                      .body19,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                            ),
                                                          ),
                                                          SizedBox(width: 2),
                                                          ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  WidgetStatePropertyAll(
                                                                    AppColor
                                                                        .primary,
                                                                  ),
                                                              shape: WidgetStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        15,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (
                                                                      context,
                                                                    ) => AlertDialog(
                                                                      actions: [
                                                                        book.status !=
                                                                                'Canceled'
                                                                            ? OutlinedButton(
                                                                              style: ButtonStyle(
                                                                                foregroundColor: WidgetStatePropertyAll(
                                                                                  Colors.red,
                                                                                ),
                                                                                side: WidgetStatePropertyAll(
                                                                                  BorderSide(
                                                                                    color:
                                                                                        Colors.red,
                                                                                  ),
                                                                                ),
                                                                                shape: WidgetStatePropertyAll(
                                                                                  RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(
                                                                                      8,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              onPressed: () {
                                                                                showDialog(
                                                                                  context:
                                                                                      context,
                                                                                  builder: (
                                                                                    context,
                                                                                  ) {
                                                                                    return AlertDialog(
                                                                                      insetPadding: EdgeInsets.symmetric(
                                                                                        horizontal:
                                                                                            0,
                                                                                        vertical:
                                                                                            0,
                                                                                      ),
                                                                                      title: Text(
                                                                                        'Confirm Cancellation',
                                                                                      ),
                                                                                      content: Text(
                                                                                        'Are you sure you want to cancel this booking?',
                                                                                      ),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () {
                                                                                            Navigator.of(
                                                                                              context,
                                                                                            ).pop();
                                                                                          },
                                                                                          child: Text(
                                                                                            'No',
                                                                                            style: TextStyle(
                                                                                              color:
                                                                                                  Colors.black,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        TextButton(
                                                                                          onPressed: () async {
                                                                                            await provBooking.updateBookingStatus(
                                                                                              lastUpdatedBy: 'mobile',
                                                                                              idUser:
                                                                                                  "zW5KVTaKz4P1CPDtKr3vSdrrcjv1",
                                                                                              idbook:
                                                                                                  book.id!,
                                                                                              status:
                                                                                                  'Canceled',
                                                                                            );
                                                                                            Navigator.of(
                                                                                              context,
                                                                                            ).pop();
                                                                                            Navigator.of(
                                                                                              context,
                                                                                            ).pop();
                                                                                          },
                                                                                          style: TextButton.styleFrom(
                                                                                            foregroundColor:
                                                                                                Colors.red,
                                                                                          ),
                                                                                          child: Text(
                                                                                            'Yes',
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                'Cancel Booking',
                                                                              ),
                                                                            )
                                                                            : SizedBox.shrink(),
                                                                        OutlinedButton(
                                                                          style: ButtonStyle(
                                                                            foregroundColor: WidgetStatePropertyAll(
                                                                              Colors.black,
                                                                            ),
                    
                                                                            shape: WidgetStatePropertyAll(
                                                                              RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(
                                                                                  8,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          onPressed: () {
                                                                            GoRouter.of(
                                                                              context,
                                                                            ).pop();
                                                                          },
                                                                          child: Text(
                                                                            'Close',
                                                                          ),
                                                                        ),
                                                                      ],
                                                                      titlePadding:
                                                                          EdgeInsets
                                                                              .zero,
                    
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              8,
                                                                            ),
                                                                      ),
                    
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      title: ClipRRect(
                                                                        borderRadius: BorderRadius.vertical(
                                                                          top: Radius.circular(
                                                                            8,
                                                                          ),
                                                                        ),
                                                                        child: Container(
                                                                          padding: EdgeInsets.all(
                                                                            10,
                                                                          ),
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              90,
                                                                          decoration: BoxDecoration(
                                                                            gradient: LinearGradient(
                                                                              colors: [
                                                                                AppColor.primary,
                                                                                AppColor.primary.withOpacity(
                                                                                  0.85,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            color:
                                                                                AppColor.primary,
                                                                          ),
                                                                          child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.white.withOpacity(
                                                                                        0.3,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(
                                                                                        10,
                                                                                      ),
                                                                                    ),
                                                                                    padding: EdgeInsets.all(
                                                                                      5,
                                                                                    ),
                    
                                                                                    child: Icon(
                                                                                      size:
                                                                                          15,
                                                                                      Icons.info_outline,
                                                                                      color:
                                                                                          Colors.white,
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width:
                                                                                        8,
                                                                                  ),
                                                                                  Text(
                                                                                    'Service Details',
                                                                                    style: AppStyle.body15.copyWith(
                                                                                      color:
                                                                                          Colors.white,
                                                                                      fontWeight:
                                                                                          FontWeight.w700,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                'Review your booked service information',
                                                                                style: AppStyle.subTitle.copyWith(
                                                                                  color:
                                                                                      Colors.white,
                                                                                  fontSize:
                                                                                      11,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      content: SizedBox(
                                                                        height:
                                                                            ScreenSize.h(
                                                                              context,
                                                                            ) *
                                                                            0.45,
                                                                        child: SingleChildScrollView(
                                                                          child: Column(
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment:
                                                                                    MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  LabeledInfoWidget(
                                                                                    label:
                                                                                        'Service Name',
                                                                                    info:
                                                                                        book.serviceName,
                                                                                    icon:
                                                                                        Icons.label_important_outline,
                                                                                  ),
                                                                                  LabeledInfoWidget(
                                                                                    infoColor:
                                                                                        book.status ==
                                                                                                'Completed'
                                                                                            ? Colors.green
                                                                                            : book.status ==
                                                                                                'InProgress'
                                                                                            ? Colors.blue
                                                                                            : book.status ==
                                                                                                'Pending'
                                                                                            ? Colors.orange
                                                                                            : Colors.red,
                                                                                    label:
                                                                                        'Status',
                                                                                    info:
                                                                                        book.status,
                                                                                    icon:
                                                                                        book.status ==
                                                                                                'Completed'
                                                                                            ? Icons.check_circle_outline_outlined
                                                                                            : book.status ==
                                                                                                'Canceled'
                                                                                            ? Icons.cancel_outlined
                                                                                            : book.status ==
                                                                                                'InProgress'
                                                                                            ? Icons.hourglass_bottom_outlined
                                                                                            : Icons.schedule_outlined,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height:
                                                                                    10,
                                                                              ),
                                                                              LabeledInfoWidget(
                                                                                label:
                                                                                    'Category',
                                                                                info:
                                                                                    book.serviceCategory,
                                                                                icon:
                                                                                    Icons.category_outlined,
                                                                              ),
                                                                              SizedBox(
                                                                                height:
                                                                                    10,
                                                                              ),
                    
                                                                              LabeledInfoWidget(
                                                                                label:
                                                                                    'Price',
                                                                                info:
                                                                                    ' \$ ${book.price}',
                                                                                icon:
                                                                                    Icons.attach_money_outlined,
                                                                              ),
                                                                              SizedBox(
                                                                                height:
                                                                                    10,
                                                                              ),
                                                                              LabeledInfoWidget(
                                                                                label:
                                                                                    'Booking Date',
                                                                                info:
                                                                                    book.date,
                                                                                icon:
                                                                                    Icons.date_range_outlined,
                                                                              ),
                                                                              SizedBox(
                                                                                height:
                                                                                    10,
                                                                              ),
                                                                              LabeledInfoWidget(
                                                                                label:
                                                                                    'Time',
                                                                                info:
                                                                                    book.time,
                                                                                icon:
                                                                                    Icons.timer_outlined,
                                                                              ),
                                                                              SizedBox(
                                                                                height:
                                                                                    10,
                                                                              ),
                    
                                                                              SizedBox(
                                                                                height:
                                                                                    10,
                                                                              ),
                    
                                                                              Column(
                                                                                crossAxisAlignment:
                                                                                    CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.description_outlined,
                                                                                        color:
                                                                                            AppColor.primary,
                                                                                        size:
                                                                                            18,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width:
                                                                                            5,
                                                                                      ),
                                                                                      Text(
                                                                                        'Description',
                                                                                        style:
                                                                                            AppStyle.body13,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height:
                                                                                        5,
                                                                                  ),
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: AppColor.primary.withOpacity(
                                                                                        0.1,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(
                                                                                        8,
                                                                                      ),
                                                                                    ),
                                                                                    padding: EdgeInsets.all(
                                                                                      10,
                                                                                    ),
                                                                                    child: Text(
                                                                                      book.serviceDescription,
                                                                                      style:
                                                                                          AppStyle.body12,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                              );
                                                            },
                                                            child: Text(
                                                              'View Details',
                                                              style: AppStyle
                                                                  .button
                                                                  .copyWith(
                                                                    fontSize:
                                                                        13,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList()
                                        : [
                                          Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  provBooking.selectedBookings ==
                                                          provBooking
                                                              .completedBookings
                                                      ? 'No completed bookings yet.'
                                                      : provBooking
                                                              .selectedBookings ==
                                                          provBooking
                                                              .inProgressBookings
                                                      ? 'No bookings in progress yet.'
                                                      : provBooking
                                                              .selectedBookings ==
                                                          provBooking
                                                              .canceledBookings
                                                      ? 'No Canceled bookings yet.'
                                                      : provBooking
                                                              .selectedBookings ==
                                                          provBooking
                                                              .pendingBookings
                                                      ? 'No Pending bookings yet.'
                                                      : 'No bookings available.',
                                                  textAlign: TextAlign.center,
                                                  style: AppStyle.body17,
                                                ),
                                                SizedBox(height: 50),
                                                provBooking.selectedBookings ==
                                                        provBooking.allBookings
                                                    ? ElevatedButton.icon(
                                                      onPressed: () {
                                                        GoRouter.of(
                                                          context,
                                                        ).pushNamed(
                                                          AppRouter
                                                              .allServicesView,
                                                        );
                                                      },
                                                      iconAlignment:
                                                          IconAlignment.end,
                                                      icon: Icon(
                                                        Icons
                                                            .arrow_forward_rounded,
                                                        color: Colors.white,
                                                      ),
                                                      label: Text(
                                                        'Book a Service',
                                                        style: AppStyle.button,
                                                      ),
                                                      style: ButtonStyle(
                                                        shape: WidgetStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  15,
                                                                ),
                                                          ),
                                                        ),
                    
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                              AppColor.secondry,
                                                            ),
                                                      ),
                                                    )
                                                    : SizedBox.shrink(),
                                              ],
                                            ),
                                          ),
                                        ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
