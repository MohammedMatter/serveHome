import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serve_home/features/booking/domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    required super.date,
    required super.time,
    required super.serviceAddress,
    required super.paymentMethod,
    required super.serviceName,
    super.note,
    super.id,
    required super.userId,
    required super.status,
    required super.imageUrl,
    required super.price,
    required super.provider,
    required super.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'serviceName': serviceName,
      'serviceAddress': serviceAddress,
      'status': status,
      'date': date.toString() , 
      'time': time,
      'paymentMethod': paymentMethod,
      'notes': note,
      'imageUrl': imageUrl,
      'price': price,
      'provider': provider,
      'email': email,
    };
  }

  factory BookModel.fromMap(Map map) {
    return BookModel(
   date: map['date'].toString(),

      time: map['time'],
      serviceAddress: map['serviceAddress'],
      paymentMethod: map['paymentMethod'],
      serviceName: map['serviceName'],
      userId: map['userId'],
      status: map['status'],
      imageUrl: map['imageUrl'],
      note: map['notes'],
      price: map['price'],
      provider: map['provider'],
      email: map['email'],
      id: map['idBooking'],
    );
  }
}
