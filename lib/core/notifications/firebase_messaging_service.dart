import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingService {
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      badge: true,
      sound: true,
      alert: true,
    ); // اطبع التوكن ل Firebase Console
    final token = await messaging.getToken();
    log("FCM TOKEN: $token");

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await FirebaseMessagingService.flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
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

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      log("App opened from terminated");
    }
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }
}

  @pragma('vm:entry-point')
 Future backgroundMessageHandler(RemoteMessage message) async {
  print("--- BACKGROUND MESSAGE RECEIVED ---");
  print("Message ID: ${message.messageId}");

  if (message.data.isNotEmpty) {
    print("Message Data: ${message.data}");
  }
  NotificationDetails details = NotificationDetails(
    android: AndroidNotificationDetails(
      'serve_home_channed',
      'ServeHome Notification',
    ),
  );
  log('BackGround Notification /*/*/*/*-+-+-+-+-+-+') ; 
  FirebaseMessagingService.flutterLocalNotificationsPlugin.show(
    0,
    message.data['title'],
    message.data['body'],
    details,
  );
}
