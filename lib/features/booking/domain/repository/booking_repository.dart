import 'package:serve_home/features/booking/data/models/book_model.dart';

abstract class BookingRepository {
  Future createBooking({required BookModel bookModel});
  Future<List<BookModel>> fetchAllBookings({required String idUser});
  Future<List<BookModel>> fetchInProgressBookings({required String idUser});
}
