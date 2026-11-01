import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../app/theme/app_colors.dart';
import 'prayer_time_card.dart';

class PrayerTimesSection extends StatelessWidget {
  const PrayerTimesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // হেডার রো: টাইটেল, লোকেশন এবং বিস্তারিত বাটন
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'আজকের নামাজের সময়',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      IconsaxPlusLinear.location,
                      size: 13,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'চট্টগ্রাম, বাংলাদেশ',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // বিস্তারিত বাটন
            InkWell(
              onTap: () {
                // নামাজের বিস্তারিত পেজ
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.softSage,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'বিস্তারিত',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.deepGreen,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // ৫ ওয়াক্তের কার্ড রো
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrayerTimeCard(
              prayerName: 'ফজর',
              time: '৪:১২',
              icon: Icons.wb_twilight_rounded,
            ),
            PrayerTimeCard(
              prayerName: 'যোহর',
              time: '১১:৫৮',
              icon: Icons.wb_sunny_rounded,
              isCurrent: true, // যোহর ওয়াক্তটি অ্যাক্টিভ হিসেবে প্রদর্শিত
            ),
            PrayerTimeCard(
              prayerName: 'আসর',
              time: '৩:৪৫',
              icon: Icons.wb_sunny_outlined,
            ),
            PrayerTimeCard(
              prayerName: 'মাগরিব',
              time: '৫:৫২',
              icon: Icons.wb_twilight_outlined,
            ),
            PrayerTimeCard(
              prayerName: 'এশা',
              time: '৬:৪৮',
              icon: Icons.nightlight_round,
            ),
          ],
        ),
      ],
    );
  }
}
