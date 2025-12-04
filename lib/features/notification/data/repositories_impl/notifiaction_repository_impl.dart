import 'package:serve_home/features/notification/data/data_sources/notification_remote_data_source.dart';
import 'package:serve_home/features/notification/data/models/notification_model.dart';
import 'package:serve_home/features/notification/domain/repositories/notification_repository.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRemoteDataSource notificationRemoteDataSource =
      NotificationRemoteDataSource();
  @override
  Future<void> addNotification({
    required String idUser,
    required NotificationModel notification,
  }) {
    return notificationRemoteDataSource.addNotification(
      idUser: idUser,
      notification: notification,
    );
  }

  @override
  Stream<List<NotificationModel>> getNotifications({required String idUser}) {
    return notificationRemoteDataSource.listenToNotifications(idUser);
  }

  @override
  Future<void> markAsRead({
    required String idNotification,
    required String idUser,
  }) {
    return notificationRemoteDataSource.markAsRead(
      idNotification: idNotification,
      idUser: idUser,
    );
  }

}
