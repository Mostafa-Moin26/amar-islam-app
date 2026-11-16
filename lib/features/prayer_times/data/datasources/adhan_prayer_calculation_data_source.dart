import 'package:adhan_dart/adhan_dart.dart' as adhan;
import 'package:timezone/timezone.dart' as tz;

import '../../domain/entities/prayer_calculation_settings.dart';
import '../../domain/entities/prayer_times_entity.dart';

class AdhanPrayerCalculationDataSource {
  PrayerTimesEntity calculate({
    required double latitude,
    required double longitude,
    required DateTime date,
    required String timeZoneId,
    PrayerCalculationSettings settings =
        PrayerCalculationSettings.ifbdProvisional,
  }) {
    _validateCoordinates(latitude, longitude);

    if (timeZoneId.trim().isEmpty) {
      throw ArgumentError.value(
        timeZoneId,
        'timeZoneId',
        'Timezone identifier cannot be empty.',
      );
    }

    final location = tz.getLocation(timeZoneId);

    final calculationDate = tz.TZDateTime(
      location,
      date.year,
      date.month,
      date.day,
    );

    final coordinates = adhan.Coordinates(latitude, longitude);

    final parameters = _buildCalculationParameters(settings, coordinates);

    final calculatedTimes = adhan.PrayerTimes(
      coordinates: coordinates,
      date: calculationDate,
      calculationParameters: parameters,
      precision: false,
    );

    return PrayerTimesEntity(
      fajr: tz.TZDateTime.from(calculatedTimes.fajr, location),
      sunrise: tz.TZDateTime.from(calculatedTimes.sunrise, location),
      dhuhr: tz.TZDateTime.from(calculatedTimes.dhuhr, location),
      asr: tz.TZDateTime.from(calculatedTimes.asr, location),
      maghrib: tz.TZDateTime.from(calculatedTimes.maghrib, location),
      isha: tz.TZDateTime.from(calculatedTimes.isha, location),
    );
  }

  adhan.CalculationParameters _buildCalculationParameters(
    PrayerCalculationSettings settings,
    adhan.Coordinates coordinates,
  ) {
    final parameters = adhan.CalculationMethodParameters.other()
      ..fajrAngle = settings.fajrAngle
      ..ishaAngle = settings.ishaAngle
      ..madhab = settings.asrMethod == AsrCalculationMethod.hanafi
          ? adhan.Madhab.hanafi
          : adhan.Madhab.shafi
      ..rounding = adhan.Rounding.nearest
      ..highLatitudeRule = adhan.HighLatitudeRule.recommended(coordinates);

    return parameters;
  }

  void _validateCoordinates(double latitude, double longitude) {
    if (!latitude.isFinite || latitude < -90 || latitude > 90) {
      throw ArgumentError.value(
        latitude,
        'latitude',
        'Latitude must be between -90 and 90.',
      );
    }

    if (!longitude.isFinite || longitude < -180 || longitude > 180) {
      throw ArgumentError.value(
        longitude,
        'longitude',
        'Longitude must be between -180 and 180.',
      );
    }
  }
}
