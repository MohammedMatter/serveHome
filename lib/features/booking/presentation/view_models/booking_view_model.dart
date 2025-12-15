import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:serve_home/core/notifications/notification_service.dart';
import 'package:serve_home/features/booking/data/models/book_model.dart';
import 'package:serve_home/features/booking/domain/use_cases/create_booking_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_all_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_all_users_bookings_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/fetch_bookings_by_status_use_case.dart';
import 'package:serve_home/features/booking/domain/use_cases/update_status_book_use_case.dart';
import 'package:serve_home/features/notification/data/models/notification_model.dart';
import 'package:serve_home/features/notification/presentation/view_models/notification_view_model.dart';

class BookingViewModel extends ChangeNotifier {
  bool _isFetched = false;
  bool isFirstBooking = false;
  int timeIndex = -1;
  int selectedBookingTabIndex = 0;
  int paymentMethodIndex = -1;
  String selectedTime = '';
  String selectedPaymentMethod = '';
  String selectedDate = '';
  String note = '';
  Set<String> notifiedBookingIds = {};

  List<BookModel> selectedBookings = [];
  List<BookModel> allBookings = [];
  List<BookModel> allUsersBookings = [];
  List<BookModel> inProgressBookings = [];
  List<BookModel> completedBookings = [];
  List<BookModel> canceledBookings = [];
  List<BookModel> pendingBookings = [];
  NotificationViewModel notificationViewModel;
  CreateBookingUseCase createBookingUseCase;
  FetchAllBookingsUseCase fetchAllBookingsUseCase;
  FetchAllUsersBookingsUseCase fetchAllUsersBookingsUseCase;
  FetchBookingsByStatusUseCase fetchBookingsByStatusUseCase;
  UpdateStatusBookUseCase updateStatusBookUseCase;

  BookingViewModel({
    required this.notificationViewModel,
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

    notifyListeners();
    switch (selectedBookingTabIndex) {
      case 0:
        selectedBookings = allBookings;
        break;
      case 1:
        selectedBookings = pendingBookings;
        break;
      case 2:
        selectedBookings = inProgressBookings;

        break;
      case 3:
        selectedBookings = completedBookings;
        break;
      case 4:
        selectedBookings = canceledBookings;
        break;
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

  Future<void> fetchAllBookings({required String idUser}) async {
    if (_isFetched) return;
    reset();
    fetchAllBookingsUseCase.call(isUser: idUser).listen((bookings) {
      _detectStatusChange(allBookings: allBookings, newBookings: bookings);
      allBookings = bookings;
      selectedBookings = allBookings;
      changeBookingTabIndex(selectedBookingTabIndex);
      if (allBookings.isEmpty) {
        isFirstBooking = true;
        notifyListeners();
      }
      _isFetched = true;
      notifyListeners();
    });
  }

  void _detectStatusChange({
    required List<BookModel> allBookings,
    required List<BookModel> newBookings,
  }) {
    for (final newBook in newBookings) {
      final oldBook = allBookings.firstWhere(
        (book) => book.id == newBook.id,
        orElse: () => newBook,
      );
      if (oldBook.status != newBook.status) {
        _onBookingStatusChanged(newBook);
      }
    }
  }

  Future _onBookingStatusChanged(BookModel booking) async {
    final message = _bookingStatusMessage(
      serviceName: booking.serviceName,
      status: booking.status,
    );
    final notificationModel = NotificationModel(
      status: booking.status,
      title: 'Status Updated',
      body: message,
      read: false,
      userId: booking.userId,
      type: 'booking',
      bookingId: booking.id,
      createAt: DateTime.now(),
    );
    NotificationService.showNotification(notification: notificationModel);
    await notificationViewModel.addNotification(
      idUser: 'zW5KVTaKz4P1CPDtKr3vSdrrcjv1',
      notification: notificationModel,
    );
    notifyListeners();
  }

  String _bookingStatusMessage({
    required String serviceName,
    required String status,
  }) {
    switch (status) {
      case 'InProgress':
        return 'The service $serviceName is now in progress.';
      case 'Pending':
        return 'The service $serviceName is now pending and awaiting confirmation.';
      case 'Completed':
        return 'The service $serviceName has been completed successfully.';
      case 'Canceled':
        return 'The service $serviceName has been canceled.';
      default:
        return 'The status of $serviceName has been updated.';
    }
  }

  Future fetchAllUsersBookings() async {
    allUsersBookings = await fetchAllUsersBookingsUseCase.call();
    notifyListeners();
  }

  void fetchInProgressBookings({required String idUser}) {
    fetchBookingsByStatusUseCase
        .call(idUser: idUser, status: 'InProgress')
        .listen((bookings) {
          inProgressBookings = bookings;
          notifyListeners();
        });

    notifyListeners();
  }

  void fetchPendingBookings({required String idUser}) {
    fetchBookingsByStatusUseCase.call(idUser: idUser, status: 'Pending').listen(
      (bookings) {
        pendingBookings = bookings;
        notifyListeners();
      },
    );

    notifyListeners();
  }

  void fetchCanceledBookings({required String idUser}) {
    fetchBookingsByStatusUseCase
        .call(idUser: idUser, status: 'Canceled')
        .listen((bookings) {
          canceledBookings = bookings;
          notifyListeners();
        });

    notifyListeners();
  }

  void fetchComoletedBookings({required String idUser}) {
    fetchBookingsByStatusUseCase
        .call(idUser: idUser, status: 'Completed')
        .listen((bookings) {
          completedBookings = bookings;
          notifyListeners();
        });

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
    timeIndex = -1;
    selectedDate = '';
    selectedTime = '';
    isFirstBooking = false;
    notificationViewModel.notifications.clear();
    allBookings.clear();
    selectedBookings.clear();
    notifyListeners();
  }
}
