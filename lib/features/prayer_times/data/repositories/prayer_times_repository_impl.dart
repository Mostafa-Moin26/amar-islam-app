import '../../domain/entities/prayer_calculation_settings.dart';
import '../../domain/entities/prayer_times_entity.dart';
import '../../domain/repositories/prayer_times_repository.dart';

import '../datasources/adhan_prayer_calculation_data_source.dart';

class PrayerTimesRepositoryImpl implements PrayerTimesRepository {
  PrayerTimesRepositoryImpl({
    required AdhanPrayerCalculationDataSource dataSource,
  }) : _dataSource = dataSource;

  final AdhanPrayerCalculationDataSource _dataSource;

  @override
  PrayerTimesEntity calculate({
    required double latitude,
    required double longitude,
    required DateTime date,
    required String timeZoneId,
    PrayerCalculationSettings settings =
        PrayerCalculationSettings.ifbdProvisional,
  }) {
    return _dataSource.calculate(
      latitude: latitude,
      longitude: longitude,
      date: date,
      timeZoneId: timeZoneId,
      settings: settings,
    );
  }
}
