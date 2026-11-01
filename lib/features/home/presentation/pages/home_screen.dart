import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../widgets/home_header.dart';
import '../widgets/islamic_date_banner.dart';
import '../widgets/prayer_times_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header
              const HomeHeader(),
              const SizedBox(height: 16),

              // 2. Islamic Date Banner
              const IslamicDateBanner(),
              const SizedBox(height: 20),

              // 3. Prayer Times Section
              const PrayerTimesSection(),
              const SizedBox(height: 24),

              // 4. Features Grid
            ],
          ),
        ),
      ),
    );
  }
}
