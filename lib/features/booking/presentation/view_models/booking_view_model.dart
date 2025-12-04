import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/domain/use_cases/create_booking_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_all_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_all_users_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_bookings_by_status_use_case.dart';
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
  List<BookModel> completedBookings = [];
  List<BookModel> canceledBookings = [];
  List<BookModel> pendingBookings = [];
  String note = '';
  CreateBookingUseCase createBookingUseCase;
  FetchAllBookingsUseCase fetchAllBookingsUseCase;
  FetchAllUsersBookingsUseCase fetchAllUsersBookingsUseCase;
  FetchBookingsByStatusUseCase fetchBookingsByStatusUseCase;

  UpdateStatusBookUseCase updateStatusBookUseCase;

  BookingViewModel({
    required this.fetchBookingsByStatusUseCase,
    required this.createBookingUseCase,
    required this.fetchAllBookingsUseCase,

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
        selectedBookings = pendingBookings;
      case 2:
        selectedBookings = inProgressBookings;
      case 3:
        selectedBookings = completedBookings;
      case 4:
        selectedBookings = canceledBookings;
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

  Future<BookModel> createBooking({required BookModel bookModel}) async {
    final book = await createBookingUseCase.call(bookModel: bookModel);
    return book;
  }

  Future selectBokking() async {}

  Future fetchAllBookings({required String idUser}) async {
    reset();
    if (_isFetched) return;
    fetchAllBookingsUseCase.call(isUser: idUser).listen((bookings) {
      log('message');
      allBookings = bookings;
      selectedBookings = allBookings;
      log(allBookings.toString());
      notifyListeners();
    });

    _isFetched = true;

    notifyListeners();
  }

  Future fetchAllUsersBookings() async {
    allUsersBookings = await fetchAllUsersBookingsUseCase.call();
    notifyListeners();
  }

  Future fetchInProgressBookings({required String idUser}) async {
    inProgressBookings = await fetchBookingsByStatusUseCase.call(
      idUser: idUser,
      status: 'InProgress',
    );

    notifyListeners();
  }

  Future fetchPendingBookings({required String idUser}) async {
    pendingBookings = await fetchBookingsByStatusUseCase.call(
      idUser: idUser,
      status: 'Pending',
    );

    notifyListeners();
  }

  Future fetchCanceledBookings({required String idUser}) async {
    canceledBookings = await fetchBookingsByStatusUseCase.call(
      idUser: idUser,
      status: 'Canceled',
    );

    notifyListeners();
  }

  Future fetchComoletedBookings({required String idUser}) async {
    completedBookings = await fetchBookingsByStatusUseCase.call(
      idUser: idUser,
      status: 'Completed',
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
