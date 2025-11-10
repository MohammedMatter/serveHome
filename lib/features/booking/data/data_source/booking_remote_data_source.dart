import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serve_home/features/booking/data/models/book_model.dart';

class BookingRemoteDataSource {
  Future createBooking(BookModel bookModel) async {
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
  }

  Future<List<BookModel>> fetchAllBookings(String idUser) async {
    log('Hellllo');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapShot =
        await firestore
            .collection('users')
            .doc(idUser)
            .collection('bookings')
            .get();
    List<BookModel> data = [];
    for (var element in snapShot.docs) {
      data.add(BookModel.fromMap(element.data()));
   
    }

    return data;
  }
  Future<List<BookModel>> fetchInProgressBookings(String idUser) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapShot =
        await firestore
            .collection('users')
            .doc(idUser)
            .collection('bookings').where('status' , isEqualTo: 'InProgress')
            .get();
    List<BookModel> data = [];
    for (var element in snapShot.docs) {
      data.add(BookModel.fromMap(element.data()));
   
    }

    return data;
  }
}
