import 'package:serve_home/features/services/data/date_sources/service_remote_data_source.dart';
import 'package:serve_home/features/services/data/date_sources/services_local_data_source.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/domain/entities/category.dart';
import 'package:serve_home/features/services/domain/repositories/services_repository.dart';

class ServicesRepositoriesImpl extends ServicesRepository {
  ServiceRemoteDataSource serviceRemoteDataSource = ServiceRemoteDataSource();
  ServicesLocalDataSource servicesLocalDataSource = ServicesLocalDataSource();
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

  @override
  List<Category> getCategories() {
    return servicesLocalDataSource.getCategories();
  }
}
