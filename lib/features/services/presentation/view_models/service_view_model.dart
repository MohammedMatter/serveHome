import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/domain/user_cases/add_services_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/delete_service_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/get_services_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/update_service_use_case.dart';

class ServiceViewModel extends ChangeNotifier {
  AddServicesUseCase addServicesUseCase;
  GetServicesUseCase getServicesUseCase;
  DeleteServiceUseCase deleteServiceUseCase;
  UpdateServiceUseCase updateServiceUseCase;
  List<ServiceModel> services = [];
  ServiceModel? selectedService;
  ServiceViewModel({
    required this.addServicesUseCase,
    required this.getServicesUseCase,
    required this.deleteServiceUseCase,
    required this.updateServiceUseCase,
  });
  void selectService(ServiceModel selectedService) {
    this.selectedService = selectedService;
    notifyListeners();
  }

  Future addService({required ServiceModel serviceModel}) async {
    await addServicesUseCase.call(serviceModel: serviceModel);
    services.add(serviceModel);
    notifyListeners();
  }

  Future getServices() async {
    services = await getServicesUseCase.call();
    notifyListeners();
  }

  Future deleteService({required ServiceModel serviceModel}) async {
    await deleteServiceUseCase.call(serviceModel: serviceModel);
    services.remove(serviceModel);
    notifyListeners();
  }

  Future updateService({required ServiceModel serviceModel}) async {
    await updateServiceUseCase.call(serviceModel: serviceModel);
    int index = services.indexOf(
      services.firstWhere((element) => element.id == serviceModel.id),
    );
    services[index] = serviceModel;
    notifyListeners();
  }
}
