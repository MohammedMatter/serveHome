import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
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

  Future updateBookingStatus({
    required String idUser,
    required String idbook,
    required String status,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
     log('${idUser}') ; 
  
    await firestore
        .collection('users')
        .doc(idUser)
        .collection('bookings')
        .doc(idbook)
        .update({'status': status});
  }

  Future<List<BookModel>> fetchAllBookings(String idUser) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
     List<BookModel> data = [];
    try {
  final snapShot =
      await firestore
          .collection('users')
          .doc(idUser)
          .collection('bookings')
          .get();
     
  for (var element in snapShot.docs) {
    data.add(BookModel.fromMap(element.data()));
  }
}  catch (e) {
  log('errrrrrrrrrrrror : ${e}') ; 
}

    return data;
  }

  Future<List<BookModel>> fetchAllUsersBookings() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final usersSnapshot = await firestore.collection('users').get();
    final List<UserModel> users = [];
    final List<BookModel> data = [];
    log('----------');
    for (var element in usersSnapshot.docs) {
      users.add(
        UserModel(
          name: element.data()['name'],
          phone: element.data()['phone'],
          email: element.data()['email'],
          id: element.data()['id'],
          role: element.data()['role']
        ),
      );
    }
log('message' );  
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
    
   for (var element in data) {
    log('--------------------------------------------') ;
    log(data.length.toString()) ; 
     
   }
    return data;
  }

  Future<List<BookModel>> fetchInProgressBookings(String idUser) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
     List<BookModel> data = [];
    try {
  final snapShot =
      await firestore
          .collection('users')
          .doc(idUser)
          .collection('bookings')
          .where('status', isEqualTo: 'InProgress')
          .get();
 
  for (var element in snapShot.docs) {
    data.add(BookModel.fromMap(element.data()));
    return data;
  }
}  catch (e) {
  log('***${e}') ; 
}
return data;  
  }
}
