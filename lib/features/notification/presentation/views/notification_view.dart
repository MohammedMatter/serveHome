import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/bottom_navigation_bar_widget.dart';
import 'package:serve_home/features/notification/presentation/view_models/notification_view_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late NotificationViewModel provNotification;
  late ServiceViewModel provService;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provNotification = Provider.of<NotificationViewModel>(
      context,
      listen: false,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final  provAuth = Provider.of<AuthViewModel>(
      context,
      listen: false,
    );
      provNotification.startListening(idUser: provAuth.user!.id!);
    });
  }

  @override
  void dispose() {
    provNotification.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<NotificationViewModel, ServiceViewModel>(
      builder:
          (context, provNotification, provService, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: ScreenSize.h(context) * 0.10,
              backgroundColor: AppColor.primary,
              centerTitle: true,
              elevation: 4,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notifications',
                    style: AppStyle.body17.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.secondry,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 68,
                    child: Text(
                      '${provNotification.unreadNotifications.length} ${provNotification.unreadNotifications.length == 1 ? 'new' : 'news'} ',
                      style: AppStyle.body15,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Color(0xFFF5F7FA),

            bottomNavigationBar: BottomNavigationBarWidget(),
            body: Consumer2<BookingViewModel, AuthViewModel>(
              builder:
                  (
                    context,
                    provBooking,
                    provAuth,
                    child,
                  ) => SingleChildScrollView(
                    child: Column(
                      children: [
                        provNotification.notifications.isNotEmpty
                            ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children:
                                      provNotification.notifications.map((
                                        notification,
                                      ) {
                                        final difference = DateTime.now()
                                            .difference(notification.createAt!);
                                        return GestureDetector(
                                          onTap: () async {
                                            await provNotification.markAsRead(
                                              idNotification: notification.id!,
                                              idUser:
                                                  'zW5KVTaKz4P1CPDtKr3vSdrrcjv1',
                                            );
                                          },
                                          child: Card(
                                            elevation:
                                                notification.read ? 0 : 1.7,

                                            shadowColor: AppColor.secondry,
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 9,
                                                  ),
                                              child: ListTile(
                                                trailing:
                                                    notification.read
                                                        ? null
                                                        : CircleAvatar(
                                                          backgroundColor:
                                                              AppColor.secondry,
                                                          radius: 6,
                                                        ),
                                                leading: CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                        255,
                                                        245,
                                                        248,
                                                        248,
                                                      ),
                                                  child: Icon(
                                                    size: 25,
                                                    notification.status ==
                                                            'Pending'
                                                        ? Icons.schedule
                                                        : notification.status ==
                                                            'InProgress'
                                                        ? Icons.hourglass_top
                                                        : notification.status ==
                                                            'Completed'
                                                        ? Icons
                                                            .done_all_outlined
                                                        : Icons.cancel,

                                                    color:
                                                        notification.status ==
                                                                'Pending'
                                                            ? Color.fromARGB(
                                                              255,
                                                              138,
                                                              136,
                                                              136,
                                                            )
                                                            : notification
                                                                    .status ==
                                                                'InProgress'
                                                            ? Colors.amber[600]
                                                            : notification
                                                                    .status ==
                                                                'Completed'
                                                            ? Colors.green
                                                            : Colors.red,
                                                  ),
                                                ),
                                                title: Text(
                                                  notification.title,
                                                  style: AppStyle.body13
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                ),
                                                subtitle: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      notification.body,
                                                      style: AppStyle.subTitle
                                                          .copyWith(
                                                            fontSize: 11,
                                                          ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      difference.inMinutes <
                                                                  60 &&
                                                              difference
                                                                      .inMinutes ==
                                                                  0
                                                          ? '1 minute ago'
                                                          : difference
                                                                  .inMinutes <
                                                              60
                                                          ? '${difference.inMinutes.toString()} minutes ago'
                                                          : difference.inHours <
                                                              24
                                                          ? '${difference.inHours.toString()} hours ago'
                                                          : '${difference.inDays.toString()} days ago',

                                                      style: AppStyle.body12
                                                          .copyWith(
                                                            color:
                                                                const Color.fromARGB(
                                                                  255,
                                                                  109,
                                                                  109,
                                                                  109,
                                                                ),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                            )
                            : Container(
                              height: 300,
                              child: Center(
                                child: Text(
                                  'No notification has been sent yet.',
                                  style: AppStyle.body16,
                                ),
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
