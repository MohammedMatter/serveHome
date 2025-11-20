import 'package:serve_home/features/booking/data/data_source/booking_remote_data_source.dart';
import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/domain/repository/booking_repository.dart';

class BookingRepositoryImpl extends BookingRepository {
  BookingRemoteDataSource bookingRemoteDataSource = BookingRemoteDataSource();

  @override
  Future createBooking({required BookModel bookModel}) {
    return bookingRemoteDataSource.createBooking(bookModel);
  }

  @override
  Future<List<BookModel>> fetchAllBookings({required String idUser}) {
    return bookingRemoteDataSource.fetchAllBookings(idUser);
  }

  @override
  Future<List<BookModel>> fetchInProgressBookings({required String idUser}) {
    return bookingRemoteDataSource.fetchInProgressBookings(idUser);
  }

  @override
  Future updateBookingStatus({
    required String idUser,
    required String idbook,
    required String status,
  }) {
    return bookingRemoteDataSource.updateBookingStatus(
      idUser: idUser,
      idbook: idbook,
      status: status,
    );
  }

  @override
  Future<List<BookModel>> fetchAllUsersBookings() {
    return bookingRemoteDataSource.fetchAllUsersBookings();
  }
}
