class LocationCoordinates {
  const LocationCoordinates({
    required this.latitude,
    required this.longitude,
    this.accuracyInMeters,
  });

  final double latitude;
  final double longitude;

  // GPS measurement accuracy. Manual locations may leave it null.
  final double? accuracyInMeters;
}
