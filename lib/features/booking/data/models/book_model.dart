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
    required super.price
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'serviceName': serviceName,
      'serviceAddress': serviceAddress,
      'status': status,
      'date': date,
      'time': time,
      'paymentMethod': paymentMethod,
      'notes': note,
      'imageUrl': imageUrl,
      'price':price
    };
  }

  factory BookModel.fromMap(Map map) {
    return BookModel(
      date: map['date'],
      time: map['time'],
      serviceAddress: map['serviceAddress'],
      paymentMethod: map['paymentMethod'],
      serviceName: map['serviceName'],
      userId: map['userId'],
      status: map['status'],
      imageUrl: map['imageUrl'],
      note: map['notes'] , 
      price: map['price']
    );
  }
}
