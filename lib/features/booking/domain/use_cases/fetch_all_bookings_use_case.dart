import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/data/repositories_impl/booking_repository_impl.dart';

class FetchAllBookingsUseCase {
  BookingRepositoryImpl bookingRepositoryImpl = BookingRepositoryImpl();
  Future<List<BookModel>> call({required isUser}) async {
    return bookingRepositoryImpl.fetchAllBookings(idUser: isUser);
  }
}
