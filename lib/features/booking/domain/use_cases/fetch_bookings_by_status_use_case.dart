import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/data/repositories_impl/booking_repository_impl.dart';

class FetchBookingsByStatusUseCase {
  BookingRepositoryImpl bookingRepositoryImpl = BookingRepositoryImpl() ; 
  Stream<List<BookModel>> call ({required String idUser , required String status}){
    return bookingRepositoryImpl.fetchBookingsByStatus(idUser: idUser, status: status) ; 
  }
}