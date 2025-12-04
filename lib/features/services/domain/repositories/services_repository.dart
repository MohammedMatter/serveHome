import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/domain/entities/category.dart';

abstract class ServicesRepository {
  Future<List<ServiceModel>> getServices();

  Future addService(ServiceModel service);
  Future updateService({required ServiceModel serviceModel}) ; 
  Future deleteService({required ServiceModel serviceModel});
  List<Category> getCategories();
}
