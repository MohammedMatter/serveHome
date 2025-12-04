import 'package:serve_home/features/notification/data/repositories_impl/notifiaction_repository_impl.dart';

class MarkAsReadUseCase {
  NotificationRepositoryImpl notifiactionRepositoryImpl =
      NotificationRepositoryImpl();

  Future<void> call({
    required String idNotification,
    required String idUser,
  }) async {
    return notifiactionRepositoryImpl.markAsRead(
      idNotification: idNotification,
      idUser: idUser,
    );
  }
}
