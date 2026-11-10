import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_theme.dart';
import '../home_dimensions.dart';

class PrayerTimeCard extends StatelessWidget {
  const PrayerTimeCard({
    required this.prayerName,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    this.isCurrent = false,
    super.key,
  });

  final String prayerName;
  final String time;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final bool isCurrent;

  static const Duration _animationDuration = Duration(milliseconds: 220);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      container: true,
      label: '$prayerName, $time',
      child: AnimatedContainer(
        duration: _animationDuration,
        curve: Curves.easeInOut,
        width: double.infinity,
        constraints: const BoxConstraints(
          minHeight: HomeDimensions.prayerCardHeight,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 3,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: isCurrent ? AppColors.softSage : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: isCurrent
                ? AppColors.deepGreen.withValues(alpha: 0.65)
                : AppColors.divider,
            width: isCurrent ? 1.3 : 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: isCurrent ? 10 : 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: HomeDimensions.prayerIconContainerSize,
              height: HomeDimensions.prayerIconContainerSize,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: iconColor,
                size: HomeDimensions.prayerIconSize,
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                prayerName,
                maxLines: 1,
                style: textTheme.labelMedium?.copyWith(
                  fontSize: HomeDimensions.prayerNameSize,
                  fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w600,
                  color: isCurrent
                      ? AppColors.deepGreen
                      : AppColors.textPrimary,
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.xs),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                time,
                maxLines: 1,
                style: textTheme.titleSmall?.copyWith(
                  fontSize: HomeDimensions.prayerTimeSize,
                  fontWeight: FontWeight.w700,
                  color: isCurrent
                      ? AppColors.deepGreen
                      : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
