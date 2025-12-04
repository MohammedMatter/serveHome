import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serve_home/features/notification/domain/entities/notification.dart';

class NotificationModel extends NotificationClass {
  NotificationModel({
    required  super.status , 
    required super.title,
    required super.body,
    required super.dateTime,
    required super.read,
    required super.userId,
    required super.type,
  required  super.createAt , 
    super.id,
    super.bookingId,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'dateTime': dateTime.toIso8601String(),
      'read': read,
      'userId': userId,
      'type': type,
      'bookingId': bookingId,
      'status': status,
      'createAt':createAt
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      dateTime: DateTime.parse(map['dateTime']),
      read: map['read'],
      userId: map['userId'],
      type: map['type'],
      bookingId: map['bookingId'],
      status: map['status'],
      createAt:( map['createAt'] as Timestamp ).toDate(),
    );
  }
}
