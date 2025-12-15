import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingService {
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();

    // اطبع التوكن ل Firebase Console
    final token =await  messaging.getToken();
    log("FCM TOKEN: $token");
    // بينما التطبيق شغال (Foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final androidNotificationDetails = AndroidNotificationDetails(
        'servehome_channel',
        'ServeHome Notifications',
        importance: Importance.high,
        priority: Priority.high,
      );
      final notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
      );
      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title!,
        message.notification!.body,
        notificationDetails,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("User opened the notification");
    });

    // إذا فتح التطبيق من إشعار وهو مغلق (Terminated)
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      log("App opened from terminated");
    }
  }
}
