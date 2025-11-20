import 'package:serve_home/features/services/domain/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel({
    super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.categoryImageUrl,
    required super.detailImageUrl,
    required super.creatdAt,
    required super.time
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'time' : time  ,
      'categoryImageUrl': categoryImageUrl,
      'creatdAt': creatdAt,
      
    };
  }

  factory ServiceModel.fromMap(Map map) {
    return ServiceModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      categoryImageUrl: map['categoryImageUrl'],
      detailImageUrl: map['categoryImageUrl'],
      creatdAt: map['creatdAt'],
      time: map['time'].toString()
    );
  }
}
