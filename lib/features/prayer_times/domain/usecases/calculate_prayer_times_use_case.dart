import '../entities/prayer_calculation_settings.dart';
import '../entities/prayer_times_entity.dart';
import '../repositories/prayer_times_repository.dart';

class CalculatePrayerTimesUseCase {
  const CalculatePrayerTimesUseCase({required PrayerTimesRepository repository})
    : _repository = repository;

  final PrayerTimesRepository _repository;

  PrayerTimesEntity call({
    required double latitude,
    required double longitude,
    required DateTime date,
    required String timeZoneId,
    PrayerCalculationSettings settings =
        PrayerCalculationSettings.ifbdProvisional,
  }) {
    return _repository.calculate(
      latitude: latitude,
      longitude: longitude,
      date: date,
      timeZoneId: timeZoneId,
      settings: settings,
    );
  }
}
