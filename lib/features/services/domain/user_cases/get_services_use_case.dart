import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/data/repositories_impl/services_repositories_impl.dart';

class GetServicesUseCase {
  ServicesRepositoriesImpl servicesRepositoriesImpl =
      ServicesRepositoriesImpl();
  Future<List<ServiceModel>> call() async {
    return servicesRepositoriesImpl.getServices();
  }
}
