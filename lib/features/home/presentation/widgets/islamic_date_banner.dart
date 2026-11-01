import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class IslamicDateBanner extends StatelessWidget {
  const IslamicDateBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.deepGreen, AppColors.darkGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGreen.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          // পেছনের হালকা মসজিদ সিলুয়েট ইফেক্ট
          Positioned(
            right: -6,
            bottom: -8,
            child: Icon(
              Icons.mosque_rounded,
              size: 80,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),

          // তারিখের তথ্য
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'মঙ্গলবার, ১৪ অক্টোবর ২০২৬',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.nightlight_round,
                    color: AppColors.mutedGold.withValues(alpha: 0.9),
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    '২২ রবিউস সানি ১৪৪৮',
                    style: TextStyle(
                      color: AppColors.mutedGold,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
