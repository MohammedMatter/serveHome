import 'package:geolocator/geolocator.dart';
import 'package:serve_home/features/booking/data/repositories_impl/location_repository_impl.dart';

class GetAddressFromLatLngUseCase {
  LocationRepositoryImpl locationRepositoryImpl = LocationRepositoryImpl();
  Future<String> call(Position position) async {
    return await locationRepositoryImpl.getAddressFromLatLng(position);
  }
}
