import 'package:serve_home/features/booking/data/repositories_impl/booking_repository_impl.dart';

class FetchBookingsByStatusUseCase {
  BookingRepositoryImpl bookingRepositoryImpl = BookingRepositoryImpl() ; 
  Future call ({required String idUser , required String status})async{
    return bookingRepositoryImpl.fetchBookingsByStatus(idUser: idUser, status: status) ; 
  }
}