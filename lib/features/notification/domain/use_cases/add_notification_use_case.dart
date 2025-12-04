import 'package:serve_home/features/notification/data/models/notification_model.dart';
import 'package:serve_home/features/notification/data/repositories_impl/notifiaction_repository_impl.dart';

class AddNotificationUseCase {
  NotificationRepositoryImpl notifiactionRepositoryImpl =
      NotificationRepositoryImpl();

  Future<void> call({
    required String idUser,
    required NotificationModel notification,
  }) async {
    return notifiactionRepositoryImpl.addNotification(
      idUser: idUser,
      notification: notification,
    );
  }
}
