import 'package:serve_home/features/services/data/date_sources/service_remote_data_source.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';

class AddServicesUseCase {
  ServiceRemoteDataSource serviceRemoteDataSource = ServiceRemoteDataSource();

  Future call({required ServiceModel serviceModel}) {
    return serviceRemoteDataSource.addService(serviceModel);
  }
}
  