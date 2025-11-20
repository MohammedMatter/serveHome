import 'package:serve_home/features/booking/data/repositories_impl/booking_repository_impl.dart';

class UpdateStatusBookUseCase {
  BookingRepositoryImpl bookingRepositoryImpl = BookingRepositoryImpl();
  Future call({
    required String idUser,
    required String idbook,
    required String status,
  }) async {
    return bookingRepositoryImpl.updateBookingStatus(
      idUser: idUser,
      idbook: idbook,
      status: status,
    );
  }
}
