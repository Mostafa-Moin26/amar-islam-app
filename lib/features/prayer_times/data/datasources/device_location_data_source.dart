import 'dart:async';

import 'package:geolocator/geolocator.dart' as geo;

import '../../domain/entities/location_coordinates.dart';
import '../../domain/exceptions/location_exception.dart';

class DeviceLocationDataSource {
  Future<LocationCoordinates> getCurrentLocation() async {
    // 1. Check whether device location service is enabled.
    final serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw const LocationException(LocationFailureReason.serviceDisabled);
    }

    // 2. Check current location permission.
    var permission = await geo.Geolocator.checkPermission();

    // 3. Request permission if currently denied.
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
    }

    // 4. Handle permanently denied permission.
    if (permission == geo.LocationPermission.deniedForever) {
      throw const LocationException(
        LocationFailureReason.permissionDeniedForever,
      );
    }

    // 5. Handle denied permission.
    if (permission == geo.LocationPermission.denied) {
      throw const LocationException(LocationFailureReason.permissionDenied);
    }

    // 6. Request current device position.
    try {
      final position = await geo.Geolocator.getCurrentPosition(
        locationSettings: const geo.LocationSettings(
          accuracy: geo.LocationAccuracy.high,
          timeLimit: Duration(seconds: 20),
        ),
      );

      // 7. Return only the data our application needs.
      return LocationCoordinates(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracyInMeters: position.accuracy,
      );
    } on TimeoutException {
      throw const LocationException(LocationFailureReason.acquisitionTimeout);
    } on geo.LocationServiceDisabledException {
      throw const LocationException(LocationFailureReason.serviceDisabled);
    } on geo.PermissionDeniedException {
      throw const LocationException(LocationFailureReason.permissionDenied);
    }
  }
}
