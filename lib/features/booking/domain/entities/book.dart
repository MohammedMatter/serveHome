class Book {
  String userId ; 
  String date;
  String time;
  String serviceAddress;
  String? note;
  String paymentMethod;
  String serviceName;
  String ?id ; 
  String status ; 
  String imageUrl ; 
  String price ; 

  Book({
    required this.id , 
    required this.userId , 
    required this.status , 
    required this.date,
    required this.time,
    required this.serviceAddress,
    required this.paymentMethod,
    required this.serviceName,
    required this.imageUrl , 
    this.note,
    required this.price ,
  });
}
