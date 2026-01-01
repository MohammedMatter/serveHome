import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
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
  List <String >statusBookings = [
    'All',
    'Pending',
    'In Progress',
    'Completed',
    'Canceled',
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(),
        body: Consumer3<BookingViewModel, ServiceViewModel, AuthViewModel>(
          builder: (context, provBooking, provService, provAuth, child) => Column(
            children: [
              SizedBox(height: ScreenSize.h(context) * 0.03),
              BookingsHeaderWidget(),
              SizedBox(height: ScreenSize.h(context) * 0.035),
              Expanded(
                child: Column(
                  children: [
                    BookingStatusTabWidget(statusBookings: statusBookings),
                    SizedBox(height: ScreenSize.h(context) * 0.03),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenSize.w(context) * 0.04,
                            vertical: ScreenSize.h(context) * 0.01,
                          ),
                          child: Column(
                            children: provBooking.selectedBookings.isNotEmpty
                                ? provBooking.selectedBookings.map(
                                    (book) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenSize.h(context) * 0.02,
                                        ),
                                        margin: EdgeInsets.only(
                                          bottom: ScreenSize.h(context) * 0.02,
                                        ),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(
                                              ScreenSize.w(context) * 0.05),
                                          color: Colors.white,
                                        ),
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BookingImageWidget(book: book),
                                            SizedBox(height: ScreenSize.h(context) * 0.02),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: ScreenSize.w(context) * 0.05,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      book.serviceName,
                                                      style: AppStyle.body19(context),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: ScreenSize.w(context) * 0.02),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              AppColor.primary),
                                                      shape: WidgetStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  ScreenSize.w(context) *
                                                                      0.03),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      showDialog(
                                                        barrierDismissible: false,
                                                        context: context,
                                                        builder: (context) => AlertDialog(
                                                          actions: [
                                                            book.status != 'Canceled'
                                                                ? OutlinedButton(
                                                                    style: ButtonStyle(
                                                                      foregroundColor:
                                                                          WidgetStatePropertyAll(
                                                                              Colors.red),
                                                                      side: WidgetStatePropertyAll(
                                                                          BorderSide(
                                                                              color:
                                                                                  Colors.red)),
                                                                      shape: WidgetStatePropertyAll(
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  ScreenSize.w(context) *
                                                                                      0.02),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    onPressed: () {
                                                                      showDialog(
                                                                        context: context,
                                                                        builder: (context) {
                                                                          return AlertDialog(
                                                                            insetPadding:
                                                                                EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                            title: Text('Confirm Cancellation'),
                                                                            content: Text(
                                                                                'Are you sure you want to cancel this booking?'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text(
                                                                                  'No',
                                                                                  style: TextStyle(color: Colors.black),
                                                                                ),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () async {
                                                                                  await provBooking.updateBookingStatus(
                                                                                    lastUpdatedBy: 'mobile',
                                                                                    idUser: provAuth.user!.id!,
                                                                                    idbook: book.id!,
                                                                                    status: 'Canceled',
                                                                                  );
                                                                                  Navigator.of(context).pop();
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                style: TextButton.styleFrom(
                                                                                  foregroundColor: Colors.red,
                                                                                ),
                                                                                child: Text('Yes'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Text('Cancel Booking'),
                                                                  )
                                                                : SizedBox.shrink(),
                                                            OutlinedButton(
                                                              style: ButtonStyle(
                                                                foregroundColor:
                                                                    WidgetStatePropertyAll(
                                                                        Colors.black),
                                                                shape: WidgetStatePropertyAll(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            ScreenSize.w(context) *
                                                                                0.02),
                                                                  ),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                GoRouter.of(context).pop();
                                                              },
                                                              child: Text('Close'),
                                                            ),
                                                          ],
                                                          titlePadding: EdgeInsets.zero,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(
                                                                ScreenSize.w(context) * 0.02),
                                                          ),
                                                          backgroundColor: Colors.white,
                                                          title: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.vertical(
                                                                    top: Radius.circular(
                                                                        ScreenSize.w(context) *
                                                                            0.02)),
                                                            child: Container(
                                                              padding: EdgeInsets.all(
                                                                  ScreenSize.w(context) * 0.03),
                                                              width: double.infinity,
                                                              height: ScreenSize.h(context) * 0.12,
                                                              decoration: BoxDecoration(
                                                                gradient: LinearGradient(
                                                                  colors: [
                                                                    AppColor.primary,
                                                                    // ignore: deprecated_member_use
                                                                    AppColor.primary.withOpacity(0.85),
                                                                  ],
                                                                ),
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
                                                                          // ignore: deprecated_member_use
                                                                          color: Colors.white.withOpacity(0.3),
                                                                          borderRadius: BorderRadius.circular(
                                                                              ScreenSize.w(context) * 0.02),
                                                                        ),
                                                                        padding: EdgeInsets.all(
                                                                            ScreenSize.w(context) * 0.01),
                                                                        child: Icon(
                                                                          size: ScreenSize.h(context) * 0.02,
                                                                          Icons.info_outline,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: ScreenSize.w(context) * 0.02),
                                                                      Text(
                                                                        'Service Details',
                                                                        style: AppStyle.body15(context).copyWith(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    'Review your booked service information',
                                                                    style: AppStyle.subTitle(context).copyWith(
                                                                      color: Colors.white,
                                                                      fontSize: ScreenSize.h(context) * 0.012,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          content: SizedBox(
                                                            height: ScreenSize.h(context) * 0.45,
                                                            child: SingleChildScrollView(
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      LabeledInfoWidget(
                                                                        label: 'Service Name',
                                                                        info: book.serviceName,
                                                                        icon: Icons.label_important_outline,
                                                                      ),
                                                                      LabeledInfoWidget(
                                                                        infoColor: book.status == 'Completed'
                                                                            ? Colors.green
                                                                            : book.status == 'InProgress'
                                                                                ? Colors.blue
                                                                                : book.status == 'Pending'
                                                                                    ? Colors.orange
                                                                                    : Colors.red,
                                                                        label: 'Status',
                                                                        info: book.status,
                                                                        icon: book.status == 'Completed'
                                                                            ? Icons.check_circle_outline_outlined
                                                                            : book.status == 'Canceled'
                                                                                ? Icons.cancel_outlined
                                                                                : book.status == 'InProgress'
                                                                                    ? Icons.hourglass_bottom_outlined
                                                                                    : Icons.schedule_outlined,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: ScreenSize.h(context) * 0.015),
                                                                  LabeledInfoWidget(
                                                                    label: 'Category',
                                                                    info: book.serviceCategory,
                                                                    icon: Icons.category_outlined,
                                                                  ),
                                                                  SizedBox(height: ScreenSize.h(context) * 0.015),
                                                                  LabeledInfoWidget(
                                                                    label: 'Price',
                                                                    info: ' \$ ${book.price}',
                                                                    icon: Icons.attach_money_outlined,
                                                                  ),
                                                                  SizedBox(height: ScreenSize.h(context) * 0.015),
                                                                  LabeledInfoWidget(
                                                                    label: 'Booking Date',
                                                                    info: book.date,
                                                                    icon: Icons.date_range_outlined,
                                                                  ),
                                                                  SizedBox(height: ScreenSize.h(context) * 0.015),
                                                                  LabeledInfoWidget(
                                                                    label: 'Time',
                                                                    info: book.time,
                                                                    icon: Icons.timer_outlined,
                                                                  ),
                                                                  SizedBox(height: ScreenSize.h(context) * 0.015),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons.description_outlined,
                                                                            color: AppColor.primary,
                                                                            size: ScreenSize.h(context) * 0.018,
                                                                          ),
                                                                          SizedBox(width: ScreenSize.w(context) * 0.015),
                                                                          Text(
                                                                            'Description',
                                                                            style: AppStyle.body13(context),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: ScreenSize.h(context) * 0.01),
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          color: AppColor.primary.withOpacity(0.1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              ScreenSize.w(context) * 0.02),
                                                                        ),
                                                                        padding: EdgeInsets.all(ScreenSize.w(context) * 0.025),
                                                                        child: Text(
                                                                          book.serviceDescription,
                                                                          style: AppStyle.body12(context),
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
                                                      style: AppStyle.button(context).copyWith(
                                                          fontSize: ScreenSize.h(context) * 0.018),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList()
                                : [
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            provBooking.selectedBookings ==
                                                    provBooking.completedBookings
                                                ? 'No completed bookings yet.'
                                                : provBooking.selectedBookings ==
                                                        provBooking.inProgressBookings
                                                    ? 'No bookings in progress yet.'
                                                    : provBooking.selectedBookings ==
                                                            provBooking.canceledBookings
                                                        ? 'No Canceled bookings yet.'
                                                        : provBooking.selectedBookings ==
                                                                provBooking.pendingBookings
                                                            ? 'No Pending bookings yet.'
                                                            : 'No bookings available.',
                                            textAlign: TextAlign.center,
                                            style: AppStyle.body17(context),
                                          ),
                                          SizedBox(height: ScreenSize.h(context) * 0.05),
                                          provBooking.selectedBookings == provBooking.allBookings
                                              ? ElevatedButton.icon(
                                                  onPressed: () {
                                                    GoRouter.of(context)
                                                        .pushNamed(AppRouter.allServicesView);
                                                  },
                                                  iconAlignment: IconAlignment.end,
                                                  icon: Icon(
                                                    Icons.arrow_forward_rounded,
                                                    color: Colors.white,
                                                  ),
                                                  label: Text(
                                                    'Book a Service',
                                                    style: AppStyle.button(context),
                                                  ),
                                                  style: ButtonStyle(
                                                    shape: WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(
                                                            ScreenSize.w(context) * 0.03),
                                                      ),
                                                    ),
                                                    backgroundColor:WidgetStatePropertyAll(
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
