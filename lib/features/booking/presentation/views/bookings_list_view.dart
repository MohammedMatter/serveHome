import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class BookingsListView extends StatelessWidget {
  const BookingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(),

      body: SingleChildScrollView(
        child: Consumer2<BookingViewModel, ServiceViewModel>(
          builder:
              (context, provBooking, provService, child) => SafeArea(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 10),
                        ],
                        color: Colors.white,
                      ),
                      height: 140,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('My Bookings', style: AppStyle.header),
                                SizedBox(
                                  width: 210,
                                  child: Text(
                                    'View and manage your service bookings',
                                    maxLines: 2,
                                    style: AppStyle.hintTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 60,
                              width: 130,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColor.secondry,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '${provBooking.selectedBookings.length} Bookings',
                                  style: AppStyle.button,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 50,
                            width: double.infinity,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          provBooking.selectedBookingTabIndex ==
                                                  0
                                              ? AppColor.primary.withOpacity(
                                                0.3,
                                              )
                                              : null,
                                      borderRadius: BorderRadius.circular(5),
                                    ),

                                    alignment: Alignment.center,
                                    height: double.infinity,
                                    child: InkWell(
                                      child: Text(
                                        'All Bookings',
                                        style: AppStyle.body17.copyWith(
                                          fontSize: 13,
                                        ),
                                      ),
                                      onTap: () {
                                        provBooking.changeBookingTabIndex(0);
                                      },
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          provBooking.selectedBookingTabIndex ==
                                                  1
                                              ? AppColor.primary.withOpacity(
                                                0.3,
                                              )
                                              : null,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    alignment: Alignment.center,
                                    height: double.infinity,

                                    child: InkWell(
                                      child: Text(
                                        'In Progress',
                                        style: AppStyle.body17.copyWith(
                                          fontSize: 13,
                                        ),
                                      ),
                                      onTap: () {
                                        provBooking.changeBookingTabIndex(1);
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          provBooking.selectedBookingTabIndex ==
                                                  2
                                              ? AppColor.primary.withOpacity(
                                                0.3,
                                              )
                                              : null,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    alignment: Alignment.center,
                                    height: double.infinity,

                                    child: InkWell(
                                      child: Text(
                                        'Completed',
                                        style: AppStyle.body17.copyWith(
                                          fontSize: 13,
                                        ),
                                      ),
                                      onTap: () {
                                        provBooking.changeBookingTabIndex(2);
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          provBooking.selectedBookingTabIndex ==
                                                  4
                                              ? AppColor.primary.withOpacity(
                                                0.3,
                                              )
                                              : null,
                                      borderRadius: BorderRadius.circular(5),
                                    ),

                                    alignment: Alignment.center,
                                    height: double.infinity,
                                    child: InkWell(
                                      child: Text(
                                        'Canceled',
                                        style: AppStyle.body17.copyWith(
                                          fontSize: 13,
                                        ),
                                      ),
                                      onTap: () {
                                        provBooking.changeBookingTabIndex(4);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            child: Column(
                              children:
                                  provBooking.selectedBookings
                                      .map(
                                        (book) => Container(
                                          margin: EdgeInsets.only(bottom: 15),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 10,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: Colors.white,
                                          ),
                                          height: 430,
                                          width: double.infinity,

                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                      top: Radius.circular(20),
                                                    ),
                                                child: SizedBox(
                                                  height: 200,
                                                  width: double.infinity,
                                                  child: Image.asset(
                                                    book.imageUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                    ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      book.serviceName,
                                                      style: AppStyle.body19,
                                                    ),
                                                    SizedBox(height: 5),
                                                    SizedBox(
                                                      child: Text(
                                                        overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        book.note ?? '',
                                                        style: AppStyle
                                                            .hintTextStyle
                                                            .copyWith(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          size: 20,
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color:
                                                              AppColor.primary,
                                                        ),
                                                        SizedBox(width: 8),
                                                        Text(
                                                          book.date,
                                                          style: AppStyle.body17
                                                              .copyWith(
                                                                color:
                                                                    Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Icon(
                                                          size: 20,
                                                          Icons
                                                              .access_time_outlined,
                                                          color:
                                                              AppColor.primary,
                                                        ),
                                                        SizedBox(width: 8),
                                                        Text(
                                                          provBooking
                                                              .selectedTime,
                                                          style: AppStyle.body17
                                                              .copyWith(
                                                                color:
                                                                    Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 15),
                                                    Divider(),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Total Price',
                                                              style:
                                                                  AppStyle
                                                                      .body17,
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              '\$ ${book.price}',
                                                              style: AppStyle
                                                                  .body17
                                                                  .copyWith(
                                                                    color:
                                                                        Colors
                                                                            .green,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
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
                                                          onPressed: () {},
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  vertical: 12,
                                                                ),
                                                            child: Text(
                                                              'View Details',
                                                              style:
                                                                  AppStyle
                                                                      .button,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
