import 'package:serve_home/features/notification/data/models/notification_model.dart';
import 'package:serve_home/features/notification/data/repositories_impl/notifiaction_repository_impl.dart';

class GetNotificationUseCase {
  NotificationRepositoryImpl notifiactionRepositoryImpl =
      NotificationRepositoryImpl();

  Stream<List<NotificationModel>> call({required String idUser}) {
    return notifiactionRepositoryImpl.getNotifications(idUser: idUser);
  }
}
