// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/domain/use_cases/create_booking_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_all_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_all_users_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_in_progress_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/update_status_book_use_case.dart';

class BookingViewModel extends ChangeNotifier {
  int timeIndex = -1;
  bool _isFetched = false;
  int selectedBookingTabIndex = 0;
  int paymentMethodIndex = -1;
  String selectedTime = '';
  List<BookModel> selectedBookings = [];
  String selectedPaymentMethod = '';
  String selectedDate = '';
  List<BookModel> allBookings = [];
  List<BookModel> allUsersBookings = [];
  List<BookModel> inProgressBookings = [];
  String note = '';
  CreateBookingUseCase createBookingUseCase;
  FetchAllBookingsUseCase fetchAllBookingsUseCase;
  FetchInProgressBookingsUseCase fetchInProgressBookingsUseCase;
  FetchAllUsersBookingsUseCase fetchAllUsersBookingsUseCase;
  UpdateStatusBookUseCase updateStatusBookUseCase;
  BookingViewModel({
    required this.createBookingUseCase,
    required this.fetchAllBookingsUseCase,
    required this.fetchInProgressBookingsUseCase,
    required this.updateStatusBookUseCase,
    required this.fetchAllUsersBookingsUseCase,
  });
  void changeTimeIndex(int timeIndex) {
    this.timeIndex = timeIndex;
    notifyListeners();
  }

  void changeBookingTabIndex(int selectedBookingTabIndex) {
    this.selectedBookingTabIndex = selectedBookingTabIndex;
    switch (selectedBookingTabIndex) {
      case 0:
        selectedBookings = allBookings;
      case 1:
        selectedBookings = inProgressBookings;
    }

    notifyListeners();
  }

  void changePaymentMethodIndex(int paymentMethodIndex) {
    this.paymentMethodIndex = paymentMethodIndex;
    notifyListeners();
  }

  void selectTime(String selectedTime) {
    this.selectedTime = selectedTime;
    notifyListeners();
  }

  void selectDate(String selectedDate) {
    this.selectedDate = selectedDate;
    notifyListeners();
  }

  void selectPaymentMethod(String selectedPaymentMethod) {
    this.selectedPaymentMethod = selectedPaymentMethod;
    notifyListeners();
  }

  void addNote(String? note) {
    this.note = note ?? 'No Notes';
    notifyListeners();
  }

  Future createBooking({required BookModel bookModel}) async {
    await createBookingUseCase.call(bookModel: bookModel);
  }

  Future fetchAllBookings({required String idUser}) async {
    reset();
    if (_isFetched) return;
    allBookings = await fetchAllBookingsUseCase.call(isUser: idUser);
    selectedBookings = allBookings;
    _isFetched = true;

    notifyListeners();
  }

  Future fetchAllUsersBookings() async {
    log('message') ; 
    allUsersBookings = await fetchAllUsersBookingsUseCase.call();
    notifyListeners();
  }

  Future fetchInProgressBookings({required String idUser}) async {
    inProgressBookings = await fetchInProgressBookingsUseCase.call(
      idUser: idUser,
    );

    notifyListeners();
  }

  Future updateBookingStatus({
    required String idUser,
    required String idbook,
    required String status,
  }) async {
    await updateStatusBookUseCase.call(
      idUser: idUser,
      idbook: idbook,
      status: status,
    );
    int index = allUsersBookings.indexOf(
      allUsersBookings.firstWhere((element) => element.id == idbook),
    );
    if (index != -1) {
      allUsersBookings[index].status = status;
    }
    notifyListeners();
  }

  void reset() {
    selectedBookingTabIndex = 0;
    selectedDate = '';
    notifyListeners();
  }
}
