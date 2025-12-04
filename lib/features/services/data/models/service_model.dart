import 'package:serve_home/features/services/domain/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel({
    required super.category,
    super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.categoryImageUrl,
    required super.detailImageUrl,
    required super.creatdAt,
    required super.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'time': time,
      'categoryImageUrl': categoryImageUrl,
      'creatdAt': creatdAt,
      'category': category,
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
      time: map['time'].toString(),
      category: map['category'],
    );
  }
  ServiceModel copyWith({String? id, required ServiceModel serviceModel}) {
    return ServiceModel(
      id:id , 
      name: serviceModel.name  , 
      description: serviceModel.description ,
      price: serviceModel.price ,
      time: serviceModel.time ,
      category: serviceModel.category,
      categoryImageUrl: serviceModel.categoryImageUrl,
      detailImageUrl: serviceModel.detailImageUrl ,
      creatdAt: serviceModel.creatdAt 
    );
  }
}
