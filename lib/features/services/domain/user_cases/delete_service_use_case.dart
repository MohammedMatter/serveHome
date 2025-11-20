import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/data/repositories_impl/services_repositories_impl.dart';

class DeleteServiceUseCase {
  ServicesRepositoriesImpl servicesRepositoriesImpl =
      ServicesRepositoriesImpl();

  Future call({required ServiceModel serviceModel}) async {
    await servicesRepositoriesImpl.deleteService(serviceModel: serviceModel);
  }
}
