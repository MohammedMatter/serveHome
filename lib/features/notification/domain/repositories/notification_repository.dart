import 'package:serve_home/features/notification/data/models/notification_model.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';

abstract class NotificationRepository {
  Future<void> addNotification({required String idUser  ,required NotificationModel notification });
Stream <List<NotificationModel>> getNotifications({required String idUser});

 Future<void> markAsRead (  {required String idNotification,
    required String idUser,});
}
