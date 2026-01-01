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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provNotification = Provider.of<NotificationViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provAuth = Provider.of<AuthViewModel>(context, listen: false);
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
    double screenHeight = ScreenSize.h(context);
    double screenWidth = ScreenSize.w(context);

    double appBarHeight = screenHeight * 0.10;
    double notificationBadgeWidth = screenWidth * 0.15;
    double circleAvatarRadius = screenWidth * 0.04;

    return Consumer2<NotificationViewModel, ServiceViewModel>(
      builder: (context, provNotification, provService, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: appBarHeight,
          backgroundColor: AppColor.primary,
          centerTitle: true,
          elevation: 4,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notifications',
                style: AppStyle.body17(context).copyWith(color: Colors.white, fontSize: screenWidth * 0.045),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.secondry,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: notificationBadgeWidth,
                child: Text(
                  '${provNotification.unreadNotifications.length} ${provNotification.unreadNotifications.length == 1 ? 'new' : 'news'}',
                  style: AppStyle.body15(context).copyWith(fontSize: screenWidth * 0.035),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFF5F7FA),
        bottomNavigationBar: const BottomNavigationBarWidget(),
        body: Consumer2<BookingViewModel, AuthViewModel>(
          builder: (context, provBooking, provAuth, child) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.02),
              child: Column(
                children: provNotification.notifications.isNotEmpty
                    ? provNotification.notifications.map((notification) {
                        final difference = DateTime.now().difference(notification.createAt!);
                        return GestureDetector(
                          onTap: () async {
                            await provNotification.markAsRead(
                              idNotification: notification.id!,
                              idUser: provAuth.user!.id!,
                            );
                          },
                          child: Card(
                            elevation: notification.read ? 0 : 2,
                            shadowColor: AppColor.secondry,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.012, horizontal: screenWidth * 0.02),
                              child: ListTile(
                                trailing: notification.read
                                    ? null
                                    : CircleAvatar(
                                        backgroundColor: AppColor.secondry,
                                        radius: circleAvatarRadius * 0.3,
                                      ),
                                leading: CircleAvatar(
                                  radius: circleAvatarRadius,
                                  backgroundColor: const Color.fromARGB(255, 245, 248, 248),
                                  child: Icon(
                                    notification.status == 'Pending'
                                        ? Icons.schedule
                                        : notification.status == 'InProgress'
                                            ? Icons.hourglass_top
                                            : notification.status == 'Completed'
                                                ? Icons.done_all_outlined
                                                : Icons.cancel,
                                    color: notification.status == 'Pending'
                                        ? const Color.fromARGB(255, 138, 136, 136)
                                        : notification.status == 'InProgress'
                                            ? Colors.amber[600]
                                            : notification.status == 'Completed'
                                                ? Colors.green
                                                : Colors.red,
                                    size: screenWidth * 0.06,
                                  ),
                                ),
                                title: Text(
                                  notification.title,
                                  style: AppStyle.body13(context).copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: screenWidth * 0.038,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: screenHeight * 0.005),
                                    Text(
                                      notification.body,
                                      style: AppStyle.subTitle(context).copyWith(fontSize: screenWidth * 0.03),
                                    ),
                                    SizedBox(height: screenHeight * 0.008),
                                    Text(
                                      difference.inMinutes < 60 && difference.inMinutes == 0
                                          ? '1 minute ago'
                                          : difference.inMinutes < 60
                                              ? '${difference.inMinutes} minutes ago'
                                              : difference.inHours < 24
                                                  ? '${difference.inHours} hours ago'
                                                  : '${difference.inDays} days ago',
                                      style: AppStyle.body12(context).copyWith(
                                        fontSize: screenWidth * 0.028,
                                        color: const Color.fromARGB(255, 109, 109, 109),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList()
                    : [
                        SizedBox(
                          height: screenHeight * 0.4,
                          child: Center(
                            child: Text(
                              'No notification has been sent yet.',
                              style: AppStyle.body16(context).copyWith(fontSize: screenWidth * 0.04),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
