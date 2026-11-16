import 'dart:io';

import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import 'package:amar_islam/features/prayer_times/domain/usecases/calculate_prayer_times_use_case.dart';
import 'package:amar_islam/features/prayer_times/presentation/bindings/prayer_times_binding.dart';

void main() {
  tzdata.initializeTimeZones();

  // Register all Prayer Times dependencies.
  PrayerTimesBinding().dependencies();

  // Get the registered UseCase.
  final calculatePrayerTimes = Get.find<CalculatePrayerTimesUseCase>();

  // Calculate prayer times.
  final result = calculatePrayerTimes(
    latitude: 22.3569,
    longitude: 91.7832,
    date: DateTime(2026, 11, 16),
    timeZoneId: 'Asia/Dhaka',
  );

  stdout.writeln('===== AMAR ISLAM PRAYER TIMES =====');
  stdout.writeln('Location: Chattogram');
  stdout.writeln('Dependency Injection: GetX');
  stdout.writeln('-----------------------------------');

  printTime('Fajr', result.fajr);
  printTime('Sunrise', result.sunrise);
  printTime('Dhuhr', result.dhuhr);
  printTime('Asr', result.asr);
  printTime('Maghrib', result.maghrib);
  printTime('Isha', result.isha);

  stdout.writeln('===================================');
}

void printTime(String label, DateTime time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.hour >= 12 ? 'PM' : 'AM';

  stdout.writeln('$label: $hour:$minute $period');
}
