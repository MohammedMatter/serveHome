import 'package:serve_home/features/services/data/models/service_model.dart';

abstract class ServicesRepository {
  Future <List<ServiceModel>> getServices();
  Future addService(ServiceModel service);
  Future deleteService({required ServiceModel serviceModel});
  Future updateService({required ServiceModel serviceModel});
}
