import 'package:serve_home/features/services/data/date_sources/services_local_data_source.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/domain/repositories/services_repository.dart';

class ServicesRepositoriesImpl extends ServicesRepository {
  @override
  ServicesLocalDataSource servicesLocalDataSource = ServicesLocalDataSource();
  List<ServiceModel> getServices() {
    return servicesLocalDataSource.getServices();
  }
}
