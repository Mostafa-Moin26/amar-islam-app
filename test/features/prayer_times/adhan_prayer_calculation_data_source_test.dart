import 'package:amar_islam/features/prayer_times/data/datasources/adhan_prayer_calculation_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  late AdhanPrayerCalculationDataSource dataSource;

  setUpAll(() {
    tz.initializeTimeZones();
  });

  setUp(() {
    dataSource = AdhanPrayerCalculationDataSource();
  });

  group('Prayer Time Calculation', () {
    test('calculates prayer times in chronological order', () {
      final result = dataSource.calculate(
        latitude: 22.3569,
        longitude: 91.7832,
        date: DateTime(2026, 11, 10),
        timeZoneId: 'Asia/Dhaka',
      );

      expect(result.fajr.isBefore(result.sunrise), isTrue);

      expect(result.sunrise.isBefore(result.dhuhr), isTrue);

      expect(result.dhuhr.isBefore(result.asr), isTrue);

      expect(result.asr.isBefore(result.maghrib), isTrue);

      expect(result.maghrib.isBefore(result.isha), isTrue);
    });

    test('rejects invalid latitude', () {
      expect(
        () => dataSource.calculate(
          latitude: 100,
          longitude: 91.7832,
          date: DateTime(2026, 11, 10),
          timeZoneId: 'Asia/Dhaka',
        ),
        throwsArgumentError,
      );
    });

    test('rejects invalid longitude', () {
      expect(
        () => dataSource.calculate(
          latitude: 22.3569,
          longitude: 200,
          date: DateTime(2026, 11, 10),
          timeZoneId: 'Asia/Dhaka',
        ),
        throwsArgumentError,
      );
    });
  });
}
