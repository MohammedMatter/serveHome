// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationClass {
  final String? id;
  final String title;
  final String body;

  final bool read;
  final String userId;
  final String type;
  final String? bookingId;
  final String  status ; 
  final DateTime ? createAt ; 
  NotificationClass({
     this.createAt , 
    required this.status , 
    this.id,
    required this.title,
    required this.body,

    required this.read,
    required this.userId,
    required this.type,
     this.bookingId,
  });
}
