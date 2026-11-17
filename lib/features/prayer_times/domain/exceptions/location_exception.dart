enum LocationFailureReason {
  serviceDisabled,
  permissionDenied,
  permissionDeniedForever,
  acquisitionTimeout,
}

class LocationException implements Exception {
  const LocationException(this.reason);

  final LocationFailureReason reason;

  @override
  String toString() => 'LocationException: ${reason.name}';
}
