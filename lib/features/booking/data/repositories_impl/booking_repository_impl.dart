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
  Stream<List<BookModel>> listenToAllBookings({required String idUser}) {
    return bookingRemoteDataSource.listenToAllBookings(idUser);
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

 
  @override
  Stream<List<BookModel>> fetchBookingsByStatus({required String idUser , required String status}) {
    return bookingRemoteDataSource.fetchBookingsByStatus(idUser , status) ; 
  }
}
