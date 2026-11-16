import 'package:get/get.dart';

import '../../features/prayer_times/presentation/bindings/prayer_times_binding.dart';
import '../../features/welcome/presentation/pages/welcome_page.dart';
import '../bindings/main_shell_binding.dart';
import '../navigation/main_shell_page.dart';
import 'app_routes.dart';

abstract final class AppPages {
  static const String initial = AppRoutes.welcome;

  static final List<GetPage<void>> pages = [
    // Welcome Route
    GetPage<void>(
      name: AppRoutes.welcome,
      page: () => const WelcomePage(),
      bindings: [MainShellBinding(), PrayerTimesBinding()],
    ),

    // Main Application Route
    GetPage<void>(
      name: AppRoutes.main,
      page: () => const MainShellPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
