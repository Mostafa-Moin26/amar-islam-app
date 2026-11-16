import 'dart:developer' as developer;

import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../domain/entities/prayer_calculation_settings.dart';
import '../../domain/entities/prayer_times_entity.dart';
import '../../domain/usecases/calculate_prayer_times_use_case.dart';

class PrayerTimesController extends GetxController {
  PrayerTimesController({
    required CalculatePrayerTimesUseCase calculatePrayerTimesUseCase,
  }) : _calculatePrayerTimesUseCase = calculatePrayerTimesUseCase;

  final CalculatePrayerTimesUseCase _calculatePrayerTimesUseCase;

  final Rxn<PrayerTimesEntity> prayerTimes = Rxn<PrayerTimesEntity>();

  final RxnString errorMessage = RxnString();

  // Temporary Chattogram coordinates for integration testing.
  static const double _demoLatitude = 22.3569;
  static const double _demoLongitude = 91.7832;

  @override
  void onReady() {
    super.onReady();

    final dhaka = tz.getLocation('Asia/Dhaka');
    final today = tz.TZDateTime.now(dhaka);

    calculateForCoordinates(
      latitude: _demoLatitude,
      longitude: _demoLongitude,
      date: today,
      timeZoneId: 'Asia/Dhaka',
    );
  }

  void calculateForCoordinates({
    required double latitude,
    required double longitude,
    required DateTime date,
    required String timeZoneId,
    PrayerCalculationSettings settings =
        PrayerCalculationSettings.ifbdProvisional,
  }) {
    errorMessage.value = null;
    prayerTimes.value = null;

    try {
      prayerTimes.value = _calculatePrayerTimesUseCase(
        latitude: latitude,
        longitude: longitude,
        date: date,
        timeZoneId: timeZoneId,
        settings: settings,
      );
    } catch (error, stackTrace) {
      developer.log(
        'Failed to calculate prayer times.',
        name: 'PrayerTimesController',
        error: error,
        stackTrace: stackTrace,
      );

      errorMessage.value = 'নামাজের সময় গণনা করা সম্ভব হয়নি।';
    }
  }
}
