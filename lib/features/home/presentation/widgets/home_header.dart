import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../app/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // বামপাশে স্পিরিচুয়াল মসজিদ/চাঁদ আইকন অবতার
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.softSage,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.deepGreen.withValues(alpha: 0.15),
              width: 1.5,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.mosque_rounded,
              color: AppColors.deepGreen,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 12),

        // শুভেচ্ছা ও বার্তা
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'আসসালামু আলাইকুম',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'আল্লাহর স্মরণে থাকি',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        // ডানপাশে সেটিংস/নোটিফিকেশন বাটন
        InkWell(
          onTap: () {
            // সেটিংস পেজের রাউট পরে যুক্ত করা হবে
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.divider),
            ),
            child: const Icon(
              IconsaxPlusLinear.setting_2,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
