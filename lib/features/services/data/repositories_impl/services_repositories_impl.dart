import 'package:serve_home/features/services/data/date_sources/service_remote_data_source.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/domain/repositories/services_repository.dart';

class ServicesRepositoriesImpl extends ServicesRepository {
  ServiceRemoteDataSource serviceRemoteDataSource = ServiceRemoteDataSource();
  @override
  Future<List<ServiceModel>> getServices() {
    return serviceRemoteDataSource.getServices();
  }

  @override
  Future addService(ServiceModel service) {
    return serviceRemoteDataSource.addService(service);
  }

  @override
  Future deleteService({required ServiceModel serviceModel}) {
    return serviceRemoteDataSource.deleteService(serviceModel: serviceModel);
  }
  @override
  Future updateService({required ServiceModel serviceModel}) {
    return serviceRemoteDataSource.updateService(serviceModel: serviceModel);
  }
}
