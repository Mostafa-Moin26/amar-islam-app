import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../home_dimensions.dart';

class IslamicDateBanner extends StatelessWidget {
  const IslamicDateBanner({this.gregorianDate, this.hijriDate, super.key});

  final String? gregorianDate;
  final String? hijriDate;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final displayedGregorianDate = gregorianDate ?? AppStrings.dateLoading;

    final displayedHijriDate = hijriDate ?? AppStrings.hijriDateLoading;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          child: AspectRatio(
            aspectRatio: HomeDimensions.bannerAspectRatio,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  AppAssets.homeDateBanner,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  filterQuality: FilterQuality.high,
                  excludeFromSemantics: true,
                ),

                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.darkGreen.withValues(alpha: 0.50),
                        AppColors.darkGreen.withValues(alpha: 0.20),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.55, 1.0],
                    ),
                  ),
                ),

                Positioned(
                  left: HomeDimensions.bannerHorizontalPadding,
                  right: constraints.maxWidth * 0.30,
                  top: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayedGregorianDate,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleSmall?.copyWith(
                            fontSize: HomeDimensions.bannerTitleSize,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.sm),

                        Row(
                          children: [
                            const Icon(
                              Icons.nightlight_round,
                              color: AppColors.mutedGold,
                              size: 17,
                            ),

                            const SizedBox(width: AppSpacing.sm),

                            Expanded(
                              child: Text(
                                displayedHijriDate,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontSize: HomeDimensions.bannerSubtitleSize,
                                  height: 1.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mutedGold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
