import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/data/repositories_impl/booking_repository_impl.dart';

class FetchAllUsersBookingsUseCase {
BookingRepositoryImpl bookingRepositoryImpl = BookingRepositoryImpl() ; 
Future <List<BookModel>>call()async{
  return bookingRepositoryImpl.fetchAllUsersBookings() ; 
}

}