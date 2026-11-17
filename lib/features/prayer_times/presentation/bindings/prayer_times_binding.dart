import 'package:get/get.dart';

import '../../data/datasources/adhan_prayer_calculation_data_source.dart';
import '../../data/datasources/device_location_data_source.dart';
import '../../data/repositories/device_location_repository_impl.dart';
import '../../data/repositories/prayer_times_repository_impl.dart';

import '../../domain/repositories/device_location_repository.dart';
import '../../domain/repositories/prayer_times_repository.dart';

import '../../domain/usecases/calculate_prayer_times_use_case.dart';
import '../../domain/usecases/get_current_location_use_case.dart';

import '../controllers/prayer_times_controller.dart';

class PrayerTimesBinding extends Bindings {
  @override
  void dependencies() {
    // Prayer calculation DataSource
    Get.lazyPut<AdhanPrayerCalculationDataSource>(
      AdhanPrayerCalculationDataSource.new,
    );

    // Prayer calculation Repository
    Get.lazyPut<PrayerTimesRepository>(
      () => PrayerTimesRepositoryImpl(
        dataSource: Get.find<AdhanPrayerCalculationDataSource>(),
      ),
    );

    // Prayer calculation UseCase
    Get.lazyPut<CalculatePrayerTimesUseCase>(
      () => CalculatePrayerTimesUseCase(
        repository: Get.find<PrayerTimesRepository>(),
      ),
    );

    // Device location DataSource
    Get.lazyPut<DeviceLocationDataSource>(DeviceLocationDataSource.new);

    // Device location Repository
    Get.lazyPut<DeviceLocationRepository>(
      () => DeviceLocationRepositoryImpl(
        dataSource: Get.find<DeviceLocationDataSource>(),
      ),
    );

    // Device location UseCase
    Get.lazyPut<GetCurrentLocationUseCase>(
      () => GetCurrentLocationUseCase(
        repository: Get.find<DeviceLocationRepository>(),
      ),
    );

    // Prayer times Controller
    Get.lazyPut<PrayerTimesController>(
      () => PrayerTimesController(
        calculatePrayerTimesUseCase: Get.find<CalculatePrayerTimesUseCase>(),
        getCurrentLocationUseCase: Get.find<GetCurrentLocationUseCase>(),
      ),
    );
  }
}
