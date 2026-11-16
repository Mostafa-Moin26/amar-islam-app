import '../entities/prayer_calculation_settings.dart';
import '../entities/prayer_times_entity.dart';

abstract class PrayerTimesRepository {
  PrayerTimesEntity calculate({
    required double latitude,
    required double longitude,
    required DateTime date,
    required String timeZoneId,
    PrayerCalculationSettings settings =
        PrayerCalculationSettings.ifbdProvisional,
  });
}
