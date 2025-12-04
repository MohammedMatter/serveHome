import 'package:serve_home/features/booking/data/models/book_model.dart';

abstract class BookingRepository {
  Future createBooking({required BookModel bookModel});
  Stream<List<BookModel>> listenToAllBookings({required String idUser});
  Future<List<BookModel>> fetchAllUsersBookings();

  Future<List<BookModel>> fetchBookingsByStatus({required String idUser , required String status });
  Future updateBookingStatus({
    required String idUser,
    required String idbook,
    required String status,
  });
}
