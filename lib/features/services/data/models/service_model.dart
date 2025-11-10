import 'package:serve_home/features/services/domain/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.categoryImageUrl,
    required super.detailImageUrl,
  });
}
