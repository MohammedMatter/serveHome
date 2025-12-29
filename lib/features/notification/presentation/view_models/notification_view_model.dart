import 'dart:async';
import 'package:flutter/material.dart';
import 'package:serve_home/core/notifications/notification_service.dart';
import 'package:serve_home/features/notification/data/models/notification_model.dart';
import 'package:serve_home/features/notification/domain/use_cases/add_notification_use_case.dart';
import 'package:serve_home/features/notification/domain/use_cases/get_notification_use_Case.dart';
import 'package:serve_home/features/notification/domain/use_cases/mark_as_read_use_case.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class NotificationViewModel extends ChangeNotifier {
  AddNotificationUseCase addNotificationUseCase;
  GetNotificationUseCase getNotificationUseCase;
  final ServiceViewModel serviceViewModel;
  MarkAsReadUseCase markAsReadUseCase;
  StreamSubscription<List<NotificationModel>>? _sub;
  NotificationViewModel({
    required this.serviceViewModel,
    required this.addNotificationUseCase,
    required this.markAsReadUseCase,
    required this.getNotificationUseCase,
  });
  List<NotificationModel> _notifications = [];
  List<NotificationModel> unreadNotifications = [];
  List<NotificationModel> bookingNotification = [];
  List<NotificationModel> get notifications => _notifications;
  Future addNotification({
    required String idUser,
    required NotificationModel notification,
  }) async {
    await addNotificationUseCase.call(
      idUser: idUser,
      notification: notification,
    );
    notifyListeners();
  }

  Future showNotification({required NotificationModel notification}) async {
    await NotificationService.showNotification(notification: notification);
  }

  Future<void> markAsRead({
    required String idNotification,
    required String idUser,
  }) async {
    await markAsReadUseCase.call(
      idNotification: idNotification,
      idUser: idUser,
    );
  }

  void startListening({required String idUser}) async {
    _sub = getNotificationUseCase.call(idUser: idUser).listen((list) async {
      _notifications.clear();
      _notifications = list;
      unreadNotifications =
          _notifications
              .where((notification) => notification.read == false)
              .map((e) => e)
              .toList();

      bookingNotification =
          _notifications
              .where((notification) => notification.type == 'booking')
              .map((notification) => notification)
              .toList();
      notifyListeners();
    });
  }

  void stopListening() {
    _sub?.cancel();
    _sub = null;
  }
}
