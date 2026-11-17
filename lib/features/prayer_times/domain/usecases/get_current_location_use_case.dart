import '../entities/location_coordinates.dart';
import '../repositories/device_location_repository.dart';

class GetCurrentLocationUseCase {
  const GetCurrentLocationUseCase({
    required DeviceLocationRepository repository,
  }) : _repository = repository;

  final DeviceLocationRepository _repository;

  Future<LocationCoordinates> call() {
    return _repository.getCurrentLocation();
  }
}
