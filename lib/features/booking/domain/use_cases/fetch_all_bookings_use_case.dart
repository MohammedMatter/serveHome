import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/data/repositories_impl/booking_repository_impl.dart';

class FetchAllBookingsUseCase {
  BookingRepositoryImpl bookingRepositoryImpl = BookingRepositoryImpl();
  Stream<List<BookModel>> call({required isUser})  {
    return bookingRepositoryImpl.listenToAllBookings(idUser: isUser);
  }
}
