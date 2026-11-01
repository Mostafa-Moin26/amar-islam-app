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
              // ১. হেডার
              const HomeHeader(),
              const SizedBox(height: 16),

              // ২. ইসলামিক ডেট ব্যানার
              const IslamicDateBanner(),
              const SizedBox(height: 20),

              // ৩. নামাজের সময় সেকশন
              const PrayerTimesSection(),
              const SizedBox(height: 24),

              // পরবর্তী ধাপে এখানে ৮টি ফিচার গ্রিড যুক্ত হবে
            ],
          ),
        ),
      ),
    );
  }
}
