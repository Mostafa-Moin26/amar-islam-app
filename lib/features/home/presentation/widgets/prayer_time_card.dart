import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class PrayerTimeCard extends StatelessWidget {
  final String prayerName;
  final String time;
  final IconData icon;
  final bool isCurrent;

  const PrayerTimeCard({
    super.key,
    required this.prayerName,
    required this.time,
    required this.icon,
    this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      decoration: BoxDecoration(
        color: isCurrent ? AppColors.softSage : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCurrent
              ? AppColors.deepGreen
              : AppColors.divider.withValues(alpha: 0.6),
          width: isCurrent ? 1.4 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            prayerName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
              color: isCurrent ? AppColors.deepGreen : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Icon(
            icon,
            size: 20,
            color: isCurrent ? AppColors.deepGreen : const Color(0xFFE59836),
          ),
          const SizedBox(height: 6),
          Text(
            time,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: isCurrent ? AppColors.deepGreen : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
