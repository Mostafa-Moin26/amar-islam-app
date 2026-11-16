import 'package:get/get.dart';

import '../../data/datasources/adhan_prayer_calculation_data_source.dart';
import '../../data/repositories/prayer_times_repository_impl.dart';
import '../../domain/repositories/prayer_times_repository.dart';
import '../../domain/usecases/calculate_prayer_times_use_case.dart';

import '../controllers/prayer_times_controller.dart';

class PrayerTimesBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<AdhanPrayerCalculationDataSource>(
      () => AdhanPrayerCalculationDataSource(),
    );

    // Repository
    Get.lazyPut<PrayerTimesRepository>(
      () => PrayerTimesRepositoryImpl(
        dataSource: Get.find<AdhanPrayerCalculationDataSource>(),
      ),
    );

    // UseCase
    Get.lazyPut<CalculatePrayerTimesUseCase>(
      () => CalculatePrayerTimesUseCase(
        repository: Get.find<PrayerTimesRepository>(),
      ),
    );

    // Controller
    Get.lazyPut<PrayerTimesController>(
      () => PrayerTimesController(
        calculatePrayerTimesUseCase: Get.find<CalculatePrayerTimesUseCase>(),
      ),
    );
  }
}
