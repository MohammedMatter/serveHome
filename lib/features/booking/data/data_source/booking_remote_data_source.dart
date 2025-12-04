import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/booking/data/models/book_model.dart';

class BookingRemoteDataSource {
  Future<BookModel> createBooking(BookModel bookModel) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final bookingRef =
        await firestore
            .collection('users')
            .doc(bookModel.userId)
            .collection('bookings')
            .doc();

    final idBooking = bookingRef.id;
    await bookingRef.set({
      ...bookModel.toMap(),
      'idBooking': idBooking,
      'createdAt': FieldValue.serverTimestamp(),
    });
    return BookModel.copyWith(bookModel, idBooking);
  }

  Future updateBookingStatus({
    required String idUser,
    required String idbook,
    required String status,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore
        .collection('users')
        .doc(idUser)
        .collection('bookings')
        .doc(idbook)
        .update({'status': status});
  }

  Stream<List<BookModel>> listenToAllBookings(String idUser) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore
        .collection('users')
        .doc(idUser)
        .collection('bookings')
        .snapshots()
        .map(
          (snapShot) =>
              snapShot.docs
                  .map((doc) => BookModel.fromMap(doc.data()))
                  .toList(),
        );
  }

  Future<List<BookModel>> fetchAllUsersBookings() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final usersSnapshot = await firestore.collection('users').get();
    final List<UserModel> users = [];
    final List<BookModel> data = [];

    for (var element in usersSnapshot.docs) {
      users.add(
        UserModel(
          name: element.data()['name'],
          phone: element.data()['phone'],
          email: element.data()['email'],
          id: element.data()['id'],
          role: element.data()['role'],
        ),
      );
    }

    for (var element in users) {
      final snapShoot =
          await firestore
              .collection('users')
              .doc(element.id)
              .collection('bookings')
              .get();
      for (var book in snapShoot.docs) {
        data.add(BookModel.fromMap(book.data()));
      }
    }

    return data;
  }

  Future<List<BookModel>> fetchBookingsByStatus(
    String idUser,
    String status,
  ) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<BookModel> data = [];
    try {
      final snapShot =
          await firestore
              .collection('users')
              .doc(idUser)
              .collection('bookings')
              .where('status', isEqualTo: status)
              .get();

      for (var element in snapShot.docs) {
        data.add(BookModel.fromMap(element.data()));
        return data;
      }
    } catch (e) {
      log('***${e}');
    }
    return data;
  }
}
