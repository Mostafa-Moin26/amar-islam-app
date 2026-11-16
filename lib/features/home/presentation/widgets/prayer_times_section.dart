import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../core/constants/app_strings.dart';
import '../home_dimensions.dart';
import 'prayer_time_card.dart';
import 'package:get/get.dart';

import 'package:amar_islam/features/prayer_times/domain/entities/prayer_times_entity.dart';
import 'package:amar_islam/features/prayer_times/presentation/controllers/prayer_times_controller.dart';

class PrayerTimesSection extends GetView<PrayerTimesController> {
  const PrayerTimesSection({
    this.locationLabel = AppStrings.locationNotSet,
    this.currentPrayer,
    this.onDetailsTap,
    super.key,
  });

  final String locationLabel;
  final String? currentPrayer;
  final VoidCallback? onDetailsTap;

  static const List<_PrayerItem> _prayers = [
    _PrayerItem(
      name: AppStrings.prayerFajr,
      icon: Icons.wb_twilight_rounded,
      iconColor: AppColors.fajrPrayerIcon,
      backgroundColor: AppColors.fajrPrayerBackground,
    ),
    _PrayerItem(
      name: AppStrings.prayerDhuhr,
      icon: Icons.wb_sunny_rounded,
      iconColor: AppColors.dhuhrPrayerIcon,
      backgroundColor: AppColors.dhuhrPrayerBackground,
    ),
    _PrayerItem(
      name: AppStrings.prayerAsr,
      icon: Icons.wb_sunny_outlined,
      iconColor: AppColors.asrPrayerIcon,
      backgroundColor: AppColors.asrPrayerBackground,
    ),
    _PrayerItem(
      name: AppStrings.prayerMaghrib,
      icon: Icons.wb_twilight_outlined,
      iconColor: AppColors.maghribPrayerIcon,
      backgroundColor: AppColors.maghribPrayerBackground,
    ),
    _PrayerItem(
      name: AppStrings.prayerIsha,
      icon: Icons.nightlight_round,
      iconColor: AppColors.ishaPrayerIcon,
      backgroundColor: AppColors.ishaPrayerBackground,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.prayerTimesTitle,
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: HomeDimensions.prayerTitleSize,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xs),

                  Row(
                    children: [
                      const Icon(
                        IconsaxPlusLinear.location,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),

                      const SizedBox(width: AppSpacing.xs),

                      Flexible(
                        child: Text(
                          locationLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: HomeDimensions.prayerLocationSize,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: AppSpacing.sm),

            _buildDetailsButton(context),
          ],
        ),

        const SizedBox(height: AppSpacing.lg),

        Obx(() {
          final result = controller.prayerTimes.value;

          return SizedBox(
            height: HomeDimensions.prayerCardHeight + 8,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(vertical: 3),
              itemCount: _prayers.length,
              separatorBuilder: (context, index) {
                return const SizedBox(width: HomeDimensions.prayerCardSpacing);
              },
              itemBuilder: (context, index) {
                final prayer = _prayers[index];

                return SizedBox(
                  width: HomeDimensions.prayerCardWidth,
                  child: PrayerTimeCard(
                    prayerName: prayer.name,
                    time: _getPrayerTime(result, index),
                    icon: prayer.icon,
                    iconColor: prayer.iconColor,
                    iconBackgroundColor: prayer.backgroundColor,
                    isCurrent: currentPrayer == prayer.name,
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }

  String _getPrayerTime(PrayerTimesEntity? result, int index) {
    if (result == null) {
      return AppStrings.prayerTimePlaceholder;
    }

    final prayerTime = switch (index) {
      0 => result.fajr,
      1 => result.dhuhr,
      2 => result.asr,
      3 => result.maghrib,
      4 => result.isha,
      _ => throw RangeError.index(index, _prayers, 'index'),
    };

    final hour = prayerTime.hour % 12 == 0 ? 12 : prayerTime.hour % 12;

    final minute = prayerTime.minute.toString().padLeft(2, '0');

    final period = prayerTime.hour >= 12 ? 'PM' : 'AM';

    return '$hour:$minute $period';
  }

  Widget _buildDetailsButton(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    );

    return Material(
      color: AppColors.softSage,
      shape: shape,
      child: InkWell(
        onTap: onDetailsTap,
        customBorder: shape,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.prayerDetails,
                style: textTheme.labelLarge?.copyWith(
                  fontSize: 13,
                  color: AppColors.deepGreen,
                ),
              ),

              const SizedBox(width: AppSpacing.xs),

              const Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: AppColors.deepGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrayerItem {
  const _PrayerItem({
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  final String name;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
}
