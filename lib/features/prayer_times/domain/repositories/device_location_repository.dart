import '../entities/location_coordinates.dart';

abstract class DeviceLocationRepository {
  Future<LocationCoordinates> getCurrentLocation();
}
