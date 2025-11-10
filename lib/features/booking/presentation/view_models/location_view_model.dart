// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:serve_home/features/booking/domain/use_cases/get_address_from_lat_lng_use_case.dart';

import 'package:serve_home/features/booking/domain/use_cases/get_current_location_use_case.dart';

class LocationViewModel extends ChangeNotifier {
  bool isLoading = false;
  Position? currentPosition;
  String address = '';

  GetCurrentLocationUseCase getCurrentLocationUseCase;
  GetAddressFromLatLngUseCase getAddressFromLatLngUseCase;
  LocationViewModel({
    required this.getCurrentLocationUseCase,
    required this.getAddressFromLatLngUseCase,
  });

  Future getCurrentLocation() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    currentPosition = await getCurrentLocationUseCase.call();
    isLoading = false;
    notifyListeners();
  }

  Future getAddressFromLatLng(Position position) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    address = await getAddressFromLatLngUseCase.call(position);
    isLoading = false;

    notifyListeners();
  }

  void selectServiceAddress(String selectedServiceAddress) {
    address = selectedServiceAddress;
    notifyListeners();
  }
}
