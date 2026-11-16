import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_theme.dart';
import '../widgets/home_feature_grid.dart';
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
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),

              const SizedBox(height: AppSpacing.lg),

              const IslamicDateBanner(),

              const SizedBox(height: AppSpacing.xl),

              const PrayerTimesSection(
                locationLabel: 'চট্টগ্রাম · পরীক্ষামূলক',
              ),

              const SizedBox(height: AppSpacing.xxl),

              const HomeFeatureGrid(),

              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
