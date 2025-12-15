import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationRemoteDataSource {
  // متغير لتخزين حالة السماح بالموقع أثناء الجلسة
  bool _isPermissionGranted = false;

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // إذا تم السماح مسبقاً، رجع الموقع مباشرة
    if (_isPermissionGranted) {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }

    // تحقق من الإذن الحالي
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, cannot request.',
      );
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      _isPermissionGranted = true; // تم السماح، خزّن الحالة
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } else {
      return Future.error('Location permission denied.');
    }
  }

  Future<String> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placeMarks[0];
      return '${place.street} - ${place.locality} - ${place.country}';
    } on Exception catch (e) {
      return Future.error('$e');
    }
  }
}
