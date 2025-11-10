import 'package:geolocator/geolocator.dart';
import 'package:serve_home/features/booking/data/repositories_impl/location_repository_impl.dart';

class GetCurrentLocationUseCase {
  LocationRepositoryImpl locationRepositoryImpl = LocationRepositoryImpl();
  Future<Position> call() async {
    return await locationRepositoryImpl.getCurrentLocation();
  }
}
