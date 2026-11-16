import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import 'package:amar_islam/features/prayer_times/domain/usecases/calculate_prayer_times_use_case.dart';
import 'package:amar_islam/features/prayer_times/presentation/bindings/prayer_times_binding.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    tzdata.initializeTimeZones();
  });

  test('GetX should resolve dependencies and calculate prayer times', () {
    // Register dependencies.
    PrayerTimesBinding().dependencies();

    // Resolve UseCase.
    final useCase = Get.find<CalculatePrayerTimesUseCase>();

    // Calculate prayer times.
    final result = useCase(
      latitude: 22.3569,
      longitude: 91.7832,
      date: DateTime(2026, 11, 16),
      timeZoneId: 'Asia/Dhaka',
    );

    // Verify prayer time sequence.
    expect(result.fajr.isBefore(result.sunrise), isTrue);
    expect(result.sunrise.isBefore(result.dhuhr), isTrue);
    expect(result.dhuhr.isBefore(result.asr), isTrue);
    expect(result.asr.isBefore(result.maghrib), isTrue);
    expect(result.maghrib.isBefore(result.isha), isTrue);

    // Verify dependency registration.
    expect(Get.isRegistered<CalculatePrayerTimesUseCase>(), isTrue);

    Get.reset();
  });
}
