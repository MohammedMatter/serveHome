import 'package:serve_home/features/services/data/models/service_model.dart';

abstract class ServicesRepository {
  List<ServiceModel> getServices();
}
