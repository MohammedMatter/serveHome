import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/data/repositories_impl/booking_repository_impl.dart';

class CreateBookingUseCase {
  BookingRepositoryImpl bookingRepositoryImpl = BookingRepositoryImpl();

  Future call({required BookModel bookModel}) async {
    return bookingRepositoryImpl.createBooking(bookModel: bookModel);
  }
}
