import 'dart:developer' as developer;

import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../domain/entities/location_coordinates.dart';
import '../../domain/entities/prayer_calculation_settings.dart';
import '../../domain/entities/prayer_times_entity.dart';
import '../../domain/exceptions/location_exception.dart';
import '../../domain/usecases/calculate_prayer_times_use_case.dart';
import '../../domain/usecases/get_current_location_use_case.dart';

class PrayerTimesController extends GetxController {
  PrayerTimesController({
    required CalculatePrayerTimesUseCase calculatePrayerTimesUseCase,
    required GetCurrentLocationUseCase getCurrentLocationUseCase,
  }) : _calculatePrayerTimesUseCase = calculatePrayerTimesUseCase,
       _getCurrentLocationUseCase = getCurrentLocationUseCase;

  final CalculatePrayerTimesUseCase _calculatePrayerTimesUseCase;
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;

  // Prayer calculation state
  final Rxn<PrayerTimesEntity> prayerTimes = Rxn<PrayerTimesEntity>();

  final RxnString errorMessage = RxnString();

  // Device location state
  final Rxn<LocationCoordinates> currentLocation = Rxn<LocationCoordinates>();

  final RxBool isLocationLoading = false.obs;

  final RxnString locationErrorMessage = RxnString();

  // Temporary coordinates for the initial UI integration.
  static const double _demoLatitude = 22.3569;
  static const double _demoLongitude = 91.7832;

  @override
  void onReady() {
    super.onReady();

    // Keep the temporary Chattogram calculation until GPS is selected.
    final dhaka = tz.getLocation('Asia/Dhaka');
    final today = tz.TZDateTime.now(dhaka);

    calculateForCoordinates(
      latitude: _demoLatitude,
      longitude: _demoLongitude,
      date: today,
      timeZoneId: 'Asia/Dhaka',
    );
  }

  // Request current device location and calculate prayer times.
  Future<void> loadCurrentLocation({
    PrayerCalculationSettings settings =
        PrayerCalculationSettings.ifbdProvisional,
  }) async {
    if (isLocationLoading.value) return;

    isLocationLoading.value = true;
    locationErrorMessage.value = null;

    try {
      // Get current device coordinates.
      final coordinates = await _getCurrentLocationUseCase();

      currentLocation.value = coordinates;

      // Use the current date in Bangladesh timezone.
      final dhaka = tz.getLocation('Asia/Dhaka');
      final today = tz.TZDateTime.now(dhaka);

      // Calculate prayer times using GPS coordinates.
      calculateForCoordinates(
        latitude: coordinates.latitude,
        longitude: coordinates.longitude,
        date: today,
        timeZoneId: 'Asia/Dhaka',
        settings: settings,
      );
    } on LocationException catch (error, stackTrace) {
      developer.log(
        'Failed to get device location.',
        name: 'PrayerTimesController',
        error: error,
        stackTrace: stackTrace,
      );

      locationErrorMessage.value = _getLocationErrorMessage(error.reason);
    } catch (error, stackTrace) {
      developer.log(
        'Unexpected location error.',
        name: 'PrayerTimesController',
        error: error,
        stackTrace: stackTrace,
      );

      locationErrorMessage.value = 'বর্তমান অবস্থান সংগ্রহ করা সম্ভব হয়নি।';
    } finally {
      isLocationLoading.value = false;
    }
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

  String _getLocationErrorMessage(LocationFailureReason reason) {
    return switch (reason) {
      LocationFailureReason.serviceDisabled =>
        'ফোনের Location বা GPS চালু করুন।',
      LocationFailureReason.permissionDenied =>
        'নামাজের সময় নির্ধারণের জন্য Location permission প্রয়োজন।',
      LocationFailureReason.permissionDeniedForever =>
        'App Settings থেকে Location permission চালু করুন।',
      LocationFailureReason.acquisitionTimeout =>
        'বর্তমান অবস্থান পাওয়া যায়নি। আবার চেষ্টা করুন।',
    };
  }
}
