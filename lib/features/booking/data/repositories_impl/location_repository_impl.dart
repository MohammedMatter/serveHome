import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:serve_home/features/booking/data/data_source/location_remote_data_source.dart';
import 'package:serve_home/features/booking/domain/repository/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  LocationRemoteDataSource locationRemoteDataSource =
      LocationRemoteDataSource();
  @override
  Future<String> getAddressFromLatLng(Position position) async {
    return await locationRemoteDataSource.getAddressFromLatLng(
      position.latitude,
      position.longitude,
    );
  }

  @override
  Future<Position> getCurrentLocation() {
    return locationRemoteDataSource.getCurrentLocation();
  }
}
