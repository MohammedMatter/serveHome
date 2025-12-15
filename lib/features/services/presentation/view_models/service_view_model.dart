import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/domain/entities/category.dart';
import 'package:serve_home/features/services/domain/user_cases/add_services_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/delete_service_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/get_categories_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/get_services_use_case.dart';
import 'package:serve_home/features/services/domain/user_cases/update_service_use_case.dart';

class ServiceViewModel extends ChangeNotifier {
  String searchText = '';
  bool isLoading = false;
  AddServicesUseCase addServicesUseCase;
  GetServicesUseCase getServicesUseCase;
  DeleteServiceUseCase deleteServiceUseCase;
  UpdateServiceUseCase updateServiceUseCase;
  GetCategoriesUseCase getCategoriesUseCase;
  List<ServiceModel> services = [];
  List<Category> categories = [];
  List<ServiceModel> servicesFilterList = [];
  List<ServiceModel> SearchServiceFilterSList = [];
  String? selectedCategory;
  bool isHovered = false;

  ServiceModel? selectedService;
  ServiceViewModel({
    required this.getCategoriesUseCase,
    required this.addServicesUseCase,
    required this.getServicesUseCase,
    required this.deleteServiceUseCase,
    required this.updateServiceUseCase,
  });
  void isContainerHovered(bool isHovered) {
    this.isHovered = isHovered;
    notifyListeners();
  }

  void reset() {
    searchText = '';
    servicesFilterList = [...services] ; 
    notifyListeners();
  }

  void changeSearchtext(String txt) {
    searchText = txt.trim();
    if (searchText.isEmpty) {
      servicesFilterList = [...services];
    } else {
      log(txt);
   
      servicesFilterList =
          services
              .where(
                (service) =>
                    service.name.toLowerCase().contains(txt.toLowerCase()),
              )
              .map((service) => service)
              .toList();
    }
    notifyListeners();
  }

  void filterServices() {
    servicesFilterList.clear();
    servicesFilterList =
        services.where((element) {
          log(element.category);
          log(selectedCategory.toString());
          return element.category == selectedCategory;
        }).toList();
    notifyListeners();
  }

  void selectService(ServiceModel selectedService) {
    this.selectedService = selectedService;
    notifyListeners();
  }

  void selectCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  Future addService({required ServiceModel serviceModel}) async {
    final id = await addServicesUseCase.call(serviceModel: serviceModel);

    services.add(serviceModel.copyWith(serviceModel: serviceModel, id: id));

    notifyListeners();
  }

  Future getServices() async {
    if (services.isNotEmpty) return;
    services.clear();
    isLoading = true;

    services = await getServicesUseCase.call();
    servicesFilterList = [...services];
    isLoading = false;
    getCategories();
    notifyListeners();
  }

  void getCategories() {
    categories = getCategoriesUseCase.call();
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
