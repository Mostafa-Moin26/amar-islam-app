import '../../domain/entities/location_coordinates.dart';
import '../../domain/repositories/device_location_repository.dart';
import '../datasources/device_location_data_source.dart';

class DeviceLocationRepositoryImpl implements DeviceLocationRepository {
  DeviceLocationRepositoryImpl({required DeviceLocationDataSource dataSource})
    : _dataSource = dataSource;

  final DeviceLocationDataSource _dataSource;

  @override
  Future<LocationCoordinates> getCurrentLocation() {
    return _dataSource.getCurrentLocation();
  }
}
