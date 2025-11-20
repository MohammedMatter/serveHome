// ignore_for_file: public_member_api_docs, sort_constructors_first
class Service {
  String ?id;
  String name;
  String description;
  String price;
  String categoryImageUrl;
  String detailImageUrl;
  String time ; 
  String creatdAt;

  Service({
    required this.id,
    required this.name,
    required this.time , 
    required this.description,
    required this.price,
    required this.categoryImageUrl,
    required this.detailImageUrl,
    required this.creatdAt,
  });
}
