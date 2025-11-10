// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';

import 'package:serve_home/features/services/domain/user_cases/get_services_use_case.dart';

class ServiceViewModel extends ChangeNotifier {
  GetServicesUseCase getServicesUseCase;
  List<ServiceModel> services = [];
  ServiceModel ?selectedService ;
  ServiceViewModel({required this.getServicesUseCase});
  void selectService(ServiceModel selectedService) {
    this.selectedService = selectedService;
    notifyListeners();
  }

  void getServices() {
    services = getServicesUseCase.call();
  }
}
